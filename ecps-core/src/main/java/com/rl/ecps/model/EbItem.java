package com.rl.ecps.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;



public class EbItem {
    private Long itemId;

    private String itemName;

    private String itemNo;

    private Long brandId;

    private Long catId;

    private Long tagImgId;

    private Short isNew;

    private Short isGood;

    private Short isHot;

    private String promotion;

    private Short auditStatus;

    private Short showStatus;

    private String imgs;

    private String keywords;

    private String pageDesc;

    private Short itemRecycle;

    private Date onSaleTime;

    private Date checkTime;

    private Date updateTime;

    private Long updateUserId;

    private Date createTime;

    private Long checkUserId;

    private String fullPathDeploy;

    private String fullPathDeployOffer;

    private Long originalItemId;

    private Short lastStatus;

    private Long merchantId;

    private Long itemSort;

    private Long sales;

    private Long createUserId;

    private Short simLevel;

    private String tagImg;
    
  //------------------
    
    private BigDecimal skuPrice;
    
        
    
    private EbItemClob itemClob;
    
    private List<EbParaValue> paraList;
    
    private List<EbSku> skuList;
    

    public EbItemClob getItemClob() {
		return itemClob;
	}

	public void setItemClob(EbItemClob itemClob) {
		this.itemClob = itemClob;
	}

	public List<EbParaValue> getParaList() {
		return paraList;
	}

	public void setParaList(List<EbParaValue> paraList) {
		this.paraList = paraList;
	}

	public List<EbSku> getSkuList() {
		return skuList;
	}

	public void setSkuList(List<EbSku> skuList) {
		this.skuList = skuList;
	}

	public BigDecimal getSkuPrice() {
		return skuPrice;
	}

	public void setSkuPrice(BigDecimal skuPrice) {
		this.skuPrice = skuPrice;
	}

	public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
    }

    public String getItemNo() {
        return itemNo;
    }

    public void setItemNo(String itemNo) {
        this.itemNo = itemNo == null ? null : itemNo.trim();
    }

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public Long getCatId() {
        return catId;
    }

    public void setCatId(Long catId) {
        this.catId = catId;
    }

    public Long getTagImgId() {
        return tagImgId;
    }

    public void setTagImgId(Long tagImgId) {
        this.tagImgId = tagImgId;
    }

    public Short getIsNew() {
        return isNew;
    }

    public void setIsNew(Short isNew) {
        this.isNew = isNew;
    }

    public Short getIsGood() {
        return isGood;
    }

    public void setIsGood(Short isGood) {
        this.isGood = isGood;
    }

    public Short getIsHot() {
        return isHot;
    }

    public void setIsHot(Short isHot) {
        this.isHot = isHot;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion == null ? null : promotion.trim();
    }

    public Short getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(Short auditStatus) {
        this.auditStatus = auditStatus;
    }

    public Short getShowStatus() {
        return showStatus;
    }

    public void setShowStatus(Short showStatus) {
        this.showStatus = showStatus;
    }

    public String getImgs() {
        return imgs;
    }

    public void setImgs(String imgs) {
        this.imgs = imgs == null ? null : imgs.trim();
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public String getPageDesc() {
        return pageDesc;
    }

    public void setPageDesc(String pageDesc) {
        this.pageDesc = pageDesc == null ? null : pageDesc.trim();
    }

    public Short getItemRecycle() {
        return itemRecycle;
    }

    public void setItemRecycle(Short itemRecycle) {
        this.itemRecycle = itemRecycle;
    }

    public Date getOnSaleTime() {
        return onSaleTime;
    }

    public void setOnSaleTime(Date onSaleTime) {
        this.onSaleTime = onSaleTime;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Long getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(Long updateUserId) {
        this.updateUserId = updateUserId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getCheckUserId() {
        return checkUserId;
    }

    public void setCheckUserId(Long checkUserId) {
        this.checkUserId = checkUserId;
    }

    public String getFullPathDeploy() {
        return fullPathDeploy;
    }

    public void setFullPathDeploy(String fullPathDeploy) {
        this.fullPathDeploy = fullPathDeploy == null ? null : fullPathDeploy.trim();
    }

    public String getFullPathDeployOffer() {
        return fullPathDeployOffer;
    }

    public void setFullPathDeployOffer(String fullPathDeployOffer) {
        this.fullPathDeployOffer = fullPathDeployOffer == null ? null : fullPathDeployOffer.trim();
    }

    public Long getOriginalItemId() {
        return originalItemId;
    }

    public void setOriginalItemId(Long originalItemId) {
        this.originalItemId = originalItemId;
    }

    public Short getLastStatus() {
        return lastStatus;
    }

    public void setLastStatus(Short lastStatus) {
        this.lastStatus = lastStatus;
    }

    public Long getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(Long merchantId) {
        this.merchantId = merchantId;
    }

    public Long getItemSort() {
        return itemSort;
    }

    public void setItemSort(Long itemSort) {
        this.itemSort = itemSort;
    }

    public Long getSales() {
        return sales;
    }

    public void setSales(Long sales) {
        this.sales = sales;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }

    public Short getSimLevel() {
        return simLevel;
    }

    public void setSimLevel(Short simLevel) {
        this.simLevel = simLevel;
    }

    public String getTagImg() {
        return tagImg;
    }

    public void setTagImg(String tagImg) {
        this.tagImg = tagImg == null ? null : tagImg.trim();
    }
}