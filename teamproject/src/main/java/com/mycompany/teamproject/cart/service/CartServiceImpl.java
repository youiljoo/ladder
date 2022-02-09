package com.mycompany.teamproject.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.teamproject.cart.dao.CartDAO;
import com.mycompany.teamproject.cart.vo.CartVO;
import com.mycompany.teamproject.goods.vo.GoodsVO;
import com.mycompany.teamproject.member.vo.MemberVO;
@Service("cartService")
@Transactional(propagation=Propagation.REQUIRED)
public class CartServiceImpl  implements CartService{
	@Autowired
	private CartDAO cartDAO;
	
	public Map<String ,List> myCartList(CartVO cartVO) throws Exception{
		Map<String,List> cartMap=new HashMap<String,List>();
		List<CartVO> myCartList=cartDAO.selectCartList(cartVO);
		if(myCartList.size()==0){
			return null;
		}
		List<GoodsVO> myGoodsList=cartDAO.selectGoodsList(myCartList);
		cartMap.put("myCartList", myCartList);
		cartMap.put("myGoodsList",myGoodsList);
		return cartMap;
	}
	
	public boolean findCartGoods(CartVO cartVO) throws Exception{
		 return cartDAO.selectCountInCart(cartVO);
	}	
	public void addGoodsInCart(CartVO cartVO) throws Exception{ 
		cartDAO.insertGoodsInCart(cartVO);
	}

	public boolean modifyCartQty(CartVO cartVO) throws Exception{
		boolean result=true;
		cartDAO.updateCartGoodsQty(cartVO);
		return result;
	}
	public void removeCartGoods(int cid) throws Exception{
		cartDAO.deleteCartGoods(cid);
	}
	public void removeAllCartGoods(String user_id) throws Exception{
		cartDAO.deleteAllCartGoods(user_id); 
	}

	@Override
	public void cartUpdate(MemberVO memberVO) {
		cartDAO.cartUpdate(memberVO);
		
	}

	
}
