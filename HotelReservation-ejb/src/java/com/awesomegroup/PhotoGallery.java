/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.awesomegroup;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author lujamanandhar
 */
@Entity
@Table(name = "photo_gallery")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PhotoGallery.findAll", query = "SELECT p FROM PhotoGallery p"),
    @NamedQuery(name = "PhotoGallery.findByGalleryId", query = "SELECT p FROM PhotoGallery p WHERE p.galleryId = :galleryId"),
    @NamedQuery(name = "PhotoGallery.findByHotelId", query = "SELECT p FROM PhotoGallery p WHERE p.hotelId = :hotelId"),
    @NamedQuery(name = "PhotoGallery.findByPhotoUrl", query = "SELECT p FROM PhotoGallery p WHERE p.photoUrl = :photoUrl"),
    @NamedQuery(name = "PhotoGallery.findByPhotoTitle", query = "SELECT p FROM PhotoGallery p WHERE p.photoTitle = :photoTitle")})
public class PhotoGallery implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "gallery_id")
    private Integer galleryId;
    @Column(name = "hotel_id")
    private Integer hotelId;
    @Size(max = 100)
    @Column(name = "photo_url")
    private String photoUrl;
    @Size(max = 20)
    @Column(name = "photo_title")
    private String photoTitle;

    public PhotoGallery() {
    }

    public PhotoGallery(Integer galleryId) {
        this.galleryId = galleryId;
    }

    public Integer getGalleryId() {
        return galleryId;
    }

    public void setGalleryId(Integer galleryId) {
        this.galleryId = galleryId;
    }

    public Integer getHotelId() {
        return hotelId;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public String getPhotoTitle() {
        return photoTitle;
    }

    public void setPhotoTitle(String photoTitle) {
        this.photoTitle = photoTitle;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (galleryId != null ? galleryId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PhotoGallery)) {
            return false;
        }
        PhotoGallery other = (PhotoGallery) object;
        if ((this.galleryId == null && other.galleryId != null) || (this.galleryId != null && !this.galleryId.equals(other.galleryId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.awesomegroup.PhotoGallery[ galleryId=" + galleryId + " ]";
    }
    
}