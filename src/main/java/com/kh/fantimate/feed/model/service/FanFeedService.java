package com.kh.fantimate.feed.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.fantimate.common.model.vo.Alarm;

import com.kh.fantimate.common.model.vo.Attachment;
import com.kh.fantimate.common.model.vo.Friend;
import com.kh.fantimate.common.model.vo.Like;
import com.kh.fantimate.common.model.vo.Message;
import com.kh.fantimate.common.model.vo.Reply;
import com.kh.fantimate.common.model.vo.ReplyCollection;
import com.kh.fantimate.common.model.vo.Report;
import com.kh.fantimate.common.model.vo.Subscribe;
import com.kh.fantimate.feed.model.vo.AttachmentF;
import com.kh.fantimate.feed.model.vo.Feed;
import com.kh.fantimate.feed.model.vo.FeedCollection;

import com.kh.fantimate.member.model.vo.Artist;
import com.kh.fantimate.member.model.vo.MemberCollection;


public interface FanFeedService {

   // 게시글 작성
   public int insertFeed(Feed f, List<AttachmentF> attList);

   // 게시글 조회
   public List<Feed> selectFeedList(String artNameEn);

   // 구독 유저 조회
   public List<Subscribe> selectSubList(String artNameEn);

   
   // 유저 프로필 사진 조회
   public List<Attachment> selectatList(String artNameEn);

   
   // 게시글 사진 조회
   public List<AttachmentF> selectptList();

   // 댓글 작성
   public int insertReply(Reply r, Alarm a);
   
   // 게시글 당 댓글 리스트 조회
   public List<Reply> selectReplyList();

   // 게시글 수정
   public int updateFeed(Feed f, List<AttachmentF> attList);
   
   // fid로 게시글 조회
   public List<Feed> selectFeed(int fid);
   
   // refId로 게시글 사진 조회
   public List<AttachmentF> selectptList(int refId);
   
   // 게시글 삭제(활성화 N으로 바꿔줌)
   public int deleteFeed(int fid);

   // 게시글 신고
   public int insertFeedReport(Report r, Alarm a);


   // 댓글 삭제
   public int deleteReply(int rid);

   // rid로 댓글번호 조회
   public List<Reply> selectReply(int rid);

   // 댓글 신고
   public int insertReplyReport(Report r, Alarm a);

   // 게시글 좋아요 누른 유저 추가 
   public int insertLike(Like l, Feed f);

   // 쪽지 보내기
   public int insertMessage(Message m);

   // 친구 신청
   public int insertFriend(Friend f, Alarm a);


   // 좋아요 누른 유저 리스트
   public List<Like> selectLikeList();

   // fid로 상세페이지 게시글 정보 불러오기
   public List<Feed> selectFeedList(int fid);

   // 아티스트 리스트
   public List<Artist> selectArtistList();

   // 게시글당 사진 갯수
   public int selectptListCount(int refId);

   // 게시글 좋아요 취소누른 유저 삭제 
   public int cancelLike(int refId, Feed f);

   // 아티스트 프로필 사진 리스트
   public List<Attachment> selectapList();

   // 댓글 모든정보 
   public List<ReplyCollection> selectReplyAllList(String artNameEn);

   // *****************좋아요 수정 ****************
   // 좋아요 인서트 
   public int insertLike2(Like like, int fid);

   // 좋아요 취소 
   public int deleteLike2(Like like,int fid);
   
   // 좋아요 갯수 select
   public int selectLike2(int fid);

   // 이미 친구신청이 되어있는지 확인
   public int isAlreadyAppliedFriend(String frSend, String frRecId);

   // 댓글 좋아요 누른 유저 리스트
   public List<Like> selectRLikeList();

   // 댓글 좋아요 인서트
   public int insertLike3(Like like, int rid);

   // 댓글 좋아요 취소
   public int deleteLike3(Like like, int rid);

   // 댓글 좋아요 갯수 select
   public int selectLike3(int rid);

   


   // 모든 유저 정보 컬렉션
  // public List<MemberCollection> selectSumList();
   

   
}
