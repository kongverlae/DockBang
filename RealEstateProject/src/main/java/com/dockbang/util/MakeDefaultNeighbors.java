package com.dockbang.util;

import java.util.List;

public class MakeDefaultNeighbors {

	public List<DijkstraNode> makeaDefaults(List<DijkstraNode> nodes){
		// (인접역, 역 사이 시간(weight)) 설정 (1 to 1)
//		for(DijkstraNode node:nodes) {
//			System.out.println("name: " + node.toString());
//		}
		
		// 인접한 양쪽 중 하나만 인접노드로 작성해도 됨
		// 평일 08:00 출발 기준
		
		// 가락시장 (경찰병원-9, 문정-30, 송파-46, 수서-48)
		findElement(nodes, "가락시장").addNeighbor(findElement(nodes, "경찰병원"), 1);
		findElement(nodes, "가락시장").addNeighbor(findElement(nodes, "문정"), 1);
		findElement(nodes, "가락시장").addNeighbor(findElement(nodes, "송파"), 1);
		findElement(nodes, "가락시장").addNeighbor(findElement(nodes, "수서"), 2);

		// 강남 (교대-12, 신논현-49, 양재-55, 역삼-58)
		findElement(nodes, "강남").addNeighbor(findElement(nodes, "교대"), 2);
		findElement(nodes, "강남").addNeighbor(findElement(nodes, "신논현"), 1);
		findElement(nodes, "강남").addNeighbor(findElement(nodes, "양재"), 2);
		findElement(nodes, "강남").addNeighbor(findElement(nodes, "역삼"), 1);

		// 강남구청 (선정릉-45, 압구정로데오-54, 청담-71, 학동-72)
		findElement(nodes, "강남구청").addNeighbor(findElement(nodes, "선정릉"), 1);
		findElement(nodes, "강남구청").addNeighbor(findElement(nodes, "압구정로데오"), 2);
		findElement(nodes, "강남구청").addNeighbor(findElement(nodes, "청담"), 1);
		findElement(nodes, "강남구청").addNeighbor(findElement(nodes, "학동"), 1);

		// 강동 (길동-16, 둔촌동-24, 천호-69)
		findElement(nodes, "강동").addNeighbor(findElement(nodes, "길동"), 1);
		findElement(nodes, "강동").addNeighbor(findElement(nodes, "둔촌동"), 2);
		findElement(nodes, "강동").addNeighbor(findElement(nodes, "천호"), 1);

		// 강동구청 (몽촌토성-29, 천호-69)
		findElement(nodes, "강동구청").addNeighbor(findElement(nodes, "몽촌토성"), 2);
		findElement(nodes, "강동구청").addNeighbor(findElement(nodes, "천호"), 1);

		// 강일 (상일동-40)
		findElement(nodes, "강일").addNeighbor(findElement(nodes, "상일동"), 2);

		// 개롱 (거여-8, 오금-59)
		findElement(nodes, "개롱").addNeighbor(findElement(nodes, "거여"), 1);
		findElement(nodes, "개롱").addNeighbor(findElement(nodes, "오금"), 1);

		// 개포동 (구룡-13, 대모산입구-20)
		findElement(nodes, "개포동").addNeighbor(findElement(nodes, "구룡"), 2);
		findElement(nodes, "개포동").addNeighbor(findElement(nodes, "대모산입구"), 1);

		// 거여 (개롱-6, 마천-26)
		findElement(nodes, "거여").addNeighbor(findElement(nodes, "개롱"), 1);
		findElement(nodes, "거여").addNeighbor(findElement(nodes, "마천"), 1);

		// 경찰병원 (가락시장-0, 오금-59)
		findElement(nodes, "경찰병원").addNeighbor(findElement(nodes, "가락시장"), 1);
		findElement(nodes, "경찰병원").addNeighbor(findElement(nodes, "오금"), 1);

		// 고덕 (명일-28, 상일동-40)
		findElement(nodes, "고덕").addNeighbor(findElement(nodes, "명일"), 2);
		findElement(nodes, "고덕").addNeighbor(findElement(nodes, "상일동"), 2);

		// 고속터미널 (교대-12, 내방-18, 반포-31, 사평-36, 신반포-50, 잠원-65)
		findElement(nodes, "고속터미널").addNeighbor(findElement(nodes, "교대"), 2);
		findElement(nodes, "고속터미널").addNeighbor(findElement(nodes, "내방"), 2);
		findElement(nodes, "고속터미널").addNeighbor(findElement(nodes, "반포"), 1);
		findElement(nodes, "고속터미널").addNeighbor(findElement(nodes, "사평"), 2);
		findElement(nodes, "고속터미널").addNeighbor(findElement(nodes, "신반포"), 1);
		findElement(nodes, "고속터미널").addNeighbor(findElement(nodes, "잠원"), 1);

		// 교대 (강남-1, 고속터미널-11, 남부터미널-17, 서초-41)
		findElement(nodes, "교대").addNeighbor(findElement(nodes, "강남"), 1);
		findElement(nodes, "교대").addNeighbor(findElement(nodes, "고속터미널"), 2);
		findElement(nodes, "교대").addNeighbor(findElement(nodes, "남부터미널"), 2);
		findElement(nodes, "교대").addNeighbor(findElement(nodes, "서초"), 1);

		// 구룡 (개포동-7, 도곡-23)
		findElement(nodes, "구룡").addNeighbor(findElement(nodes, "개포동"), 2);
		findElement(nodes, "구룡").addNeighbor(findElement(nodes, "도곡"), 1);

		// 구반포 (신반포-50)
		findElement(nodes, "구반포").addNeighbor(findElement(nodes, "신반포"), 1);

		// 굽은다리 (길동-16, 명일-28)
		findElement(nodes, "굽은다리").addNeighbor(findElement(nodes, "길동"), 1);
		findElement(nodes, "굽은다리").addNeighbor(findElement(nodes, "명일"), 1);

		// 길동 (강동-3, 굽은다리-15)
		findElement(nodes, "길동").addNeighbor(findElement(nodes, "강동"), 1);
		findElement(nodes, "길동").addNeighbor(findElement(nodes, "굽은다리"), 1);
		
		// 남부터미널 (교대-12, 양재-55)
		findElement(nodes, "남부터미널").addNeighbor(findElement(nodes, "교대"), 1);
		findElement(nodes, "남부터미널").addNeighbor(findElement(nodes, "양재"), 2);

		// 내방 (고속터미널-11)
		findElement(nodes, "내방").addNeighbor(findElement(nodes, "고속터미널"), 2);

		// 논현 (반포-31, 신논현-49, 신사-51, 학동-72)
		findElement(nodes, "논현").addNeighbor(findElement(nodes, "반포"), 1);
		findElement(nodes, "논현").addNeighbor(findElement(nodes, "신논현"), 2);
		findElement(nodes, "논현").addNeighbor(findElement(nodes, "신사"), 1);
		findElement(nodes, "논현").addNeighbor(findElement(nodes, "학동"), 2);

		// 대모산입구 (개포동-7, 수서-48)
		findElement(nodes, "대모산입구").addNeighbor(findElement(nodes, "개포동"), 1);
		findElement(nodes, "대모산입구").addNeighbor(findElement(nodes, "수서"), 3);

		// 대청 (일원-61, 학여울-73)
		findElement(nodes, "대청").addNeighbor(findElement(nodes, "일원"), 1);
		findElement(nodes, "대청").addNeighbor(findElement(nodes, "학여울"), 1);

		// 대치 (도곡-23, 학여울-73)
		findElement(nodes, "대치").addNeighbor(findElement(nodes, "도곡"), 1);
		findElement(nodes, "대치").addNeighbor(findElement(nodes, "학여울"), 1);

		// 도곡 (구룡-13, 대치-22, 매봉-27, 한티-75)
		findElement(nodes, "도곡").addNeighbor(findElement(nodes, "구룡"), 1);
		findElement(nodes, "도곡").addNeighbor(findElement(nodes, "대치"), 1);
		findElement(nodes, "도곡").addNeighbor(findElement(nodes, "매봉"), 1);
		findElement(nodes, "도곡").addNeighbor(findElement(nodes, "한티"), 1);

		// 둔촌동 (강동-3, 올림픽공원-60)
		findElement(nodes, "둔촌동").addNeighbor(findElement(nodes, "강동"), 2);
		findElement(nodes, "둔촌동").addNeighbor(findElement(nodes, "올림픽공원"), 2);

		// 둔촌오륜 (올림픽공원-60, 중앙보훈병원-68)
		findElement(nodes, "둔촌오륜").addNeighbor(findElement(nodes, "올림픽공원"), 2);
		findElement(nodes, "둔촌오륜").addNeighbor(findElement(nodes, "중앙보훈병원"), 2);

		// 마천 (거여-8)
		findElement(nodes, "마천").addNeighbor(findElement(nodes, "거여"), 2);

		// 매봉 (도곡-23, 양재-55)
		findElement(nodes, "매봉").addNeighbor(findElement(nodes, "도곡"), 1);
		findElement(nodes, "매봉").addNeighbor(findElement(nodes, "양재"), 2);

		// 명일 (고덕-10, 굽은다리-15)
		findElement(nodes, "명일").addNeighbor(findElement(nodes, "고덕"), 2);
		findElement(nodes, "명일").addNeighbor(findElement(nodes, "굽은다리"), 2);

		// 몽촌토성 (강동구청-4, 잠실-62)
		findElement(nodes, "몽촌토성").addNeighbor(findElement(nodes, "강동구청"), 2);
		findElement(nodes, "몽촌토성").addNeighbor(findElement(nodes, "잠실"), 1);

		// 문정 (가락시장-0, 장지-66)
		findElement(nodes, "문정").addNeighbor(findElement(nodes, "가락시장"), 2);
		findElement(nodes, "문정").addNeighbor(findElement(nodes, "장지"), 1);

		// 반포 (고속터미널-11, 논현-19)
		findElement(nodes, "반포").addNeighbor(findElement(nodes, "고속터미널"), 1);
		findElement(nodes, "반포").addNeighbor(findElement(nodes, "논현"), 1);

		// 방배 (서초-41)
		findElement(nodes, "방배").addNeighbor(findElement(nodes, "서초"), 2);

		// 방이 (오금-59, 올림픽공원-60)
		findElement(nodes, "방이").addNeighbor(findElement(nodes, "오금"), 2);
		findElement(nodes, "방이").addNeighbor(findElement(nodes, "올림픽공원"), 1);
		
		
		// 복정 (수서-48, 장지-66)
		findElement(nodes, "복정").addNeighbor(findElement(nodes, "수서"), 3);
		findElement(nodes, "복정").addNeighbor(findElement(nodes, "장지"), 1);
		
		// 봉은사 (삼성중앙-38, 종합운동장-67)
		findElement(nodes, "봉은사").addNeighbor(findElement(nodes, "삼성중앙"), 2);
		findElement(nodes, "봉은사").addNeighbor(findElement(nodes, "종합운동장"), 2);

		// 사평 (고속터미널-11, 신논현-49)
		findElement(nodes, "사평").addNeighbor(findElement(nodes, "고속터미널"), 2);
		findElement(nodes, "사평").addNeighbor(findElement(nodes, "신논현"), 2);

		// 삼성 (선릉-44, 종합운동장-67)
		findElement(nodes, "삼성").addNeighbor(findElement(nodes, "선릉"), 2);
		findElement(nodes, "삼성").addNeighbor(findElement(nodes, "종합운동장"), 2);

		// 삼성중앙 (봉은사-35, 선정릉-45)
		findElement(nodes, "삼성중앙").addNeighbor(findElement(nodes, "봉은사"), 1);
		findElement(nodes, "삼성중앙").addNeighbor(findElement(nodes, "선정릉"), 2);

		// 삼전 (석촌고분-43, 종합운동장-67)
		findElement(nodes, "삼전").addNeighbor(findElement(nodes, "석촌고분"), 2);
		findElement(nodes, "삼전").addNeighbor(findElement(nodes, "종합운동장"), 2);

		// 상일동 (강일-5, 고덕-10)
		findElement(nodes, "상일동").addNeighbor(findElement(nodes, "강일"), 1);
		findElement(nodes, "상일동").addNeighbor(findElement(nodes, "고덕"), 2);

		// 서초 (교대-12, 방배-32)
		findElement(nodes, "서초").addNeighbor(findElement(nodes, "교대"), 1);
		findElement(nodes, "서초").addNeighbor(findElement(nodes, "방배"), 2);

		// 석촌 (석촌고분-43, 송파나루-47)
		findElement(nodes, "석촌").addNeighbor(findElement(nodes, "석촌고분"), 2);
		findElement(nodes, "석촌").addNeighbor(findElement(nodes, "송파나루"), 2);

		// 석촌고분 (삼전-39, 석촌-42)
		findElement(nodes, "석촌고분").addNeighbor(findElement(nodes, "삼전"), 2);
		findElement(nodes, "석촌고분").addNeighbor(findElement(nodes, "석촌"), 2);

		// 선릉 (삼성-37, 역삼-58)
		findElement(nodes, "선릉").addNeighbor(findElement(nodes, "삼성"), 1);
		findElement(nodes, "선릉").addNeighbor(findElement(nodes, "역삼"), 1);
		findElement(nodes, "선릉").addNeighbor(findElement(nodes, "선정릉"), 2);
		findElement(nodes, "선릉").addNeighbor(findElement(nodes, "한티"), 2);

		// 선정릉 (삼성중앙-38, 언주-57)
		findElement(nodes, "선정릉").addNeighbor(findElement(nodes, "삼성중앙"), 1);
		findElement(nodes, "선정릉").addNeighbor(findElement(nodes, "언주"), 2);
		findElement(nodes, "선정릉").addNeighbor(findElement(nodes, "선릉"), 2);

		// 송파 (가락시장-0, 석촌-42)
		findElement(nodes, "송파").addNeighbor(findElement(nodes, "가락시장"), 1);
		findElement(nodes, "송파").addNeighbor(findElement(nodes, "석촌"), 2);

		// 송파나루 (석촌-42, 한성백제-74)
		findElement(nodes, "송파나루").addNeighbor(findElement(nodes, "석촌"), 1);
		findElement(nodes, "송파나루").addNeighbor(findElement(nodes, "한성백제"), 1);

		// 수서 (가락시장-0, 대모산입구-20, 복정-34, 일원-61)
		findElement(nodes, "수서").addNeighbor(findElement(nodes, "가락시장"), 2);
		findElement(nodes, "수서").addNeighbor(findElement(nodes, "대모산입구"), 3);
		findElement(nodes, "수서").addNeighbor(findElement(nodes, "복정"), 3);
		findElement(nodes, "수서").addNeighbor(findElement(nodes, "일원"), 2);

		// 신논현 (사평-36, 언주-57)
		findElement(nodes, "신논현").addNeighbor(findElement(nodes, "사평"), 2);
		findElement(nodes, "신논현").addNeighbor(findElement(nodes, "언주"), 1);

		// 신반포 (고속터미널-11, 구반포-14)
		findElement(nodes, "신반포").addNeighbor(findElement(nodes, "고속터미널"), 1);
		findElement(nodes, "신반포").addNeighbor(findElement(nodes, "구반포"), 1);

		// 신사 (논현-19, 압구정-53, 잠원-65)
		findElement(nodes, "신사").addNeighbor(findElement(nodes, "논현"), 1);
		findElement(nodes, "신사").addNeighbor(findElement(nodes, "압구정"), 2);
		findElement(nodes, "신사").addNeighbor(findElement(nodes, "잠원"), 1);

		// 암사 (천호-69)
		findElement(nodes, "암사").addNeighbor(findElement(nodes, "천호"), 2);

		// 압구정 (신사-51)
		findElement(nodes, "압구정").addNeighbor(findElement(nodes, "신사"), 2);

		// 압구정로데오 (강남구청-2)
		findElement(nodes, "압구정로데오").addNeighbor(findElement(nodes, "강남구청"), 2);
		
		// 양재 (강남-1, 남부터미널-17, 매봉-27, 양재시민의숲-56)
		findElement(nodes, "양재").addNeighbor(findElement(nodes, "강남"), 2);
		findElement(nodes, "양재").addNeighbor(findElement(nodes, "남부터미널"), 2);
		findElement(nodes, "양재").addNeighbor(findElement(nodes, "매봉"), 2);
		findElement(nodes, "양재").addNeighbor(findElement(nodes, "양재시민의숲"), 2);

		// 양재시민의숲 (양재-55, 청계산입구-70)
		findElement(nodes, "양재시민의숲").addNeighbor(findElement(nodes, "양재"), 2);
		findElement(nodes, "양재시민의숲").addNeighbor(findElement(nodes, "청계산입구"), 3);

		// 언주 (선정릉-45, 신논현-49)
		findElement(nodes, "언주").addNeighbor(findElement(nodes, "선정릉"), 1);
		findElement(nodes, "언주").addNeighbor(findElement(nodes, "신논현"), 1);

		// 역삼 (강남-1, 선릉-44)
		findElement(nodes, "역삼").addNeighbor(findElement(nodes, "강남"), 1);
		findElement(nodes, "역삼").addNeighbor(findElement(nodes, "선릉"), 2);

		// 오금 (개롱-6, 경찰병원-9, 방이-33)
		findElement(nodes, "오금").addNeighbor(findElement(nodes, "개롱"), 1);
		findElement(nodes, "오금").addNeighbor(findElement(nodes, "경찰병원"), 1);
		findElement(nodes, "오금").addNeighbor(findElement(nodes, "방이"), 1);

		// 올림픽공원 (둔촌동-24, 둔촌오륜-25, 방이-33, 한성백제-74)
		findElement(nodes, "올림픽공원").addNeighbor(findElement(nodes, "둔촌동"), 1);
		findElement(nodes, "올림픽공원").addNeighbor(findElement(nodes, "둔촌오륜"), 2);
		findElement(nodes, "올림픽공원").addNeighbor(findElement(nodes, "방이"), 1);
		findElement(nodes, "올림픽공원").addNeighbor(findElement(nodes, "한성백제"), 2);

		// 일원 (대청-21, 수서-48)
		findElement(nodes, "일원").addNeighbor(findElement(nodes, "대청"), 1);
		findElement(nodes, "일원").addNeighbor(findElement(nodes, "수서"), 2);

		// 잠실 (몽촌토성-29, 석촌-42, 잠실나루-63, 잠실새내-64)
		findElement(nodes, "잠실").addNeighbor(findElement(nodes, "몽촌토성"), 1);
		findElement(nodes, "잠실").addNeighbor(findElement(nodes, "석촌"), 1);
		findElement(nodes, "잠실").addNeighbor(findElement(nodes, "잠실나루"), 1);
		findElement(nodes, "잠실").addNeighbor(findElement(nodes, "잠실새내"), 2);

		// 잠실나루 (잠실-62)
		findElement(nodes, "잠실나루").addNeighbor(findElement(nodes, "잠실"), 1);

		// 잠실새내 (잠실-62, 종합운동장-67)
		findElement(nodes, "잠실새내").addNeighbor(findElement(nodes, "잠실"), 2);
		findElement(nodes, "잠실새내").addNeighbor(findElement(nodes, "종합운동장"), 2);

		// 잠원 (고속터미널-11, 신사-51)
		findElement(nodes, "잠원").addNeighbor(findElement(nodes, "고속터미널"), 1);
		findElement(nodes, "잠원").addNeighbor(findElement(nodes, "신사"), 1);

		// 장지 (문정-30, 복정-34)
		findElement(nodes, "장지").addNeighbor(findElement(nodes, "문정"), 1);
		findElement(nodes, "장지").addNeighbor(findElement(nodes, "복정"), 1);

		// 종합운동장 (봉은사-35, 삼성-37, 삼전-39, 잠실새내-64)
		findElement(nodes, "종합운동장").addNeighbor(findElement(nodes, "봉은사"), 2);
		findElement(nodes, "종합운동장").addNeighbor(findElement(nodes, "삼성"), 2);
		findElement(nodes, "종합운동장").addNeighbor(findElement(nodes, "삼전"), 3);
		findElement(nodes, "종합운동장").addNeighbor(findElement(nodes, "잠실새내"), 2);

		// 중앙보훈병원 (둔촌오륜-25)
		findElement(nodes, "중앙보훈병원").addNeighbor(findElement(nodes, "둔촌오륜"), 2);

		// 천호 (강동구청-4, 암사-52)
		findElement(nodes, "천호").addNeighbor(findElement(nodes, "강동구청"), 2);
		findElement(nodes, "천호").addNeighbor(findElement(nodes, "암사"), 1);

		// 청계산입구 (양재시민의숲-56)
		findElement(nodes, "청계산입구").addNeighbor(findElement(nodes, "양재시민의숲"), 2);

		// 청담 (강남구청-2)
		findElement(nodes, "청담").addNeighbor(findElement(nodes, "강남구청"), 1);
		
		// 학동 (강남구청-2, 논현-19)
		findElement(nodes, "학동").addNeighbor(findElement(nodes, "강남구청"), 1);
		findElement(nodes, "학동").addNeighbor(findElement(nodes, "논현"), 2);

		// 학여울 (대청-21, 대치-22)
		findElement(nodes, "학여울").addNeighbor(findElement(nodes, "대청"), 1);
		findElement(nodes, "학여울").addNeighbor(findElement(nodes, "대치"), 1);

		// 한성백제 (송파나루-47, 올림픽공원-60)
		findElement(nodes, "한성백제").addNeighbor(findElement(nodes, "송파나루"), 1);
		findElement(nodes, "한성백제").addNeighbor(findElement(nodes, "올림픽공원"), 2);

		// 한티 (도곡-23, 선릉-44)
		findElement(nodes, "한티").addNeighbor(findElement(nodes, "도곡"), 1);
		findElement(nodes, "한티").addNeighbor(findElement(nodes, "선릉"), 2);
		
		return nodes;
	}
	
//	public List<AStarNode> makeDefaults(List<AStarNode> nodes){
		// 인접역 추가 (1 to many)
		
//		System.out.println("size: " + nodes.size());
//		for(AStarNode node:nodes) {
//			System.out.println("name: " + node.getData());
//			System.out.println("name: " + node.toString() +
//					" latitude: " + node.getX() + " longitude: " + node.getY());
//		}
//		System.out.println();

		// 주의: 인접한 양쪽 모두 서로 인접노드로 작성할 것
		// 구조 바꿔야함 - 챗지피티 활용할것
		
////		name: 가락시장 (경찰병원-9, 문정-30, 송파-46, 수서-48)
////		System.out.println(nodes.get(0).getData());
//		nodes.get(0).addNeighbors(nodes.get(9), nodes.get(30), nodes.get(46), nodes.get(48));
//		findElement(nodes, "가락시장").addNeighbors(findElement(nodes, "경찰병원"), findElement(nodes, "문정"), findElement(nodes, "송파"), findElement(nodes, "수서"));
//
////		name: 강남 (교대-12, 신논현-49, 양재-55, 역삼-58)
////		System.out.println(nodes.get(1).getData());
//		nodes.get(1).addNeighbors(nodes.get(12), nodes.get(49), nodes.get(55), nodes.get(58));
//
////		name: 강남구청 (선정릉-45, 압구정로데오-54, 청담-71, 학동-72)
////		System.out.println(nodes.get(2).getData());
//		nodes.get(2).addNeighbors(nodes.get(45), nodes.get(54), nodes.get(71), nodes.get(72));
//
////		name: 강동 (길동-16, 둔촌동-24, 천호-69)
////		System.out.println(nodes.get(3).getData());
//		nodes.get(3).addNeighbors(nodes.get(16), nodes.get(24), nodes.get(69));
//
////		name: 강동구청 (몽촌토성-29, 천호-69)
////		System.out.println(nodes.get(4).getData());
//		nodes.get(4).addNeighbors(nodes.get(29), nodes.get(69));
//
////		name: 강일 (상일동-40)
////		System.out.println(nodes.get(5).getData());
//		nodes.get(5).addNeighbors(nodes.get(40));
//		
////		name: 개롱 (거여-8, 오금-59)
////		System.out.println(nodes.get(6).getData());
//		nodes.get(6).addNeighbors(nodes.get(8), nodes.get(59));
//		
////		name: 개포동 (구룡-13, 대모산입구-20)
////		System.out.println(nodes.get(7).getData());
//		nodes.get(7).addNeighbors(nodes.get(13), nodes.get(20));
//		
////		name: 거여 (개롱-6, 마천-26)
////		System.out.println(nodes.get(8).getData());
//		nodes.get(8).addNeighbors(nodes.get(6), nodes.get(26));
//		
////		name: 경찰병원 (가락시장-0, 오금-59)
////		System.out.println(nodes.get(9).getData());
//		nodes.get(9).addNeighbors(nodes.get(0), nodes.get(59));
//		
////		name: 고덕 (명일-28, 상일동-40)
////		System.out.println(nodes.get(10).getData());
//		nodes.get(10).addNeighbors(nodes.get(28), nodes.get(40));
//		
////		name: 고속터미널 (교대-12, 내방-18, 반포-31, 사평-36, 신반포-50, 잠원-65)
////		System.out.println(nodes.get(11).getData());
//		nodes.get(11).addNeighbors(nodes.get(12), nodes.get(18), nodes.get(31), nodes.get(36), nodes.get(50), nodes.get(65));
//		
////		name: 교대 (강남-1, 고속터미널-11, 남부터미널-17, 서초-41)
////		System.out.println(nodes.get(12).getData());
//		nodes.get(12).addNeighbors(nodes.get(1), nodes.get(11), nodes.get(17), nodes.get(41));
//		
////		name: 구룡 (개포동-7, 도곡-23)
////		System.out.println(nodes.get(13).getData());
//		nodes.get(13).addNeighbors(nodes.get(7), nodes.get(23));
//		
////		name: 구반포 (신반포-50)
////		System.out.println(nodes.get(14).getData());
//		nodes.get(14).addNeighbors(nodes.get(50));
//		
////		name: 굽은다리 (길동-16, 명일-28)
////		System.out.println(nodes.get(15).getData());
//		nodes.get(15).addNeighbors(nodes.get(16), nodes.get(28));
//		
////		name: 길동 (강동-3, 굽은다리-15)
////		System.out.println(nodes.get(16).getData());
//		nodes.get(16).addNeighbors(nodes.get(3), nodes.get(15));
//		
////		name: 남부터미널 (교대-12, 양재-55)
////		System.out.println(nodes.get(17).getData());
//		nodes.get(17).addNeighbors(nodes.get(12), nodes.get(55));
//		
////		name: 내방 (고속터미널-11)
////		System.out.println(nodes.get(18).getData());
//		nodes.get(18).addNeighbors(nodes.get(11));
//		
////		name: 논현 (반포-31, 신논현-49, 신사-51, 학동-72)
////		System.out.println(nodes.get(19).getData());
//		nodes.get(19).addNeighbors(nodes.get(31), nodes.get(49), nodes.get(51), nodes.get(72));
//		
////		name: 대모산입구 (개포동-7, 수서-48)
////		System.out.println(nodes.get(20).getData());
//		nodes.get(20).addNeighbors(nodes.get(7), nodes.get(48));
//		
////		name: 대청 (일원-61, 학여울-73)
////		System.out.println(nodes.get(21).getData());
//		nodes.get(21).addNeighbors(nodes.get(61), nodes.get(73));
//		
////		name: 대치 (도곡-23, 학여울-73)
////		System.out.println(nodes.get(22).getData());
//		nodes.get(22).addNeighbors(nodes.get(23), nodes.get(73));
//		
////		name: 도곡 (구룡-13, 대치-22, 매봉-27, 한티-75)
////		System.out.println(nodes.get(23).getData());
//		nodes.get(23).addNeighbors(nodes.get(13), nodes.get(22), nodes.get(27), nodes.get(75));
//		
////		name: 둔촌동 (강동-3, 올림픽공원-60)
////		System.out.println(nodes.get(24).getData());
//		nodes.get(24).addNeighbors(nodes.get(3), nodes.get(60));
//		
////		name: 둔촌오륜 (올림픽공원-60, 중앙보훈병원-68)
////		System.out.println(nodes.get(25).getData());
//		nodes.get(25).addNeighbors(nodes.get(60), nodes.get(68));
//		
////		name: 마천 (거여-8)
////		System.out.println(nodes.get(26).getData());
//		nodes.get(26).addNeighbors(nodes.get(8));
//		
////		name: 매봉 (도곡-23, 양재-55)
////		System.out.println(nodes.get(27).getData());
//		nodes.get(27).addNeighbors(nodes.get(23), nodes.get(55));
//		
////		name: 명일 (고덕-10, 굽은다리-15)
////		System.out.println(nodes.get(28).getData());
//		nodes.get(28).addNeighbors(nodes.get(10), nodes.get(15));
//		
////		name: 몽촌토성 (강동구청-4, 잠실-62)
////		System.out.println(nodes.get(29).getData());
//		nodes.get(29).addNeighbors(nodes.get(4), nodes.get(62));
//		
////		name: 문정 (가락시장-0, 장지-66)
////		System.out.println(nodes.get(30).getData());
//		nodes.get(30).addNeighbors(nodes.get(0), nodes.get(66));
//		
////		name: 반포 (고속터미널-11, 논현-19)
////		System.out.println(nodes.get(31).getData());
//		nodes.get(31).addNeighbors(nodes.get(11), nodes.get(19));
//		
////		name: 방배 (서초-41)
////		System.out.println(nodes.get(32).getData());
//		nodes.get(32).addNeighbors(nodes.get(41));
//		
////		name: 방이 (오금-59, 올림픽공원-60)
////		System.out.println(nodes.get(33).getData());
//		nodes.get(33).addNeighbors(nodes.get(59), nodes.get(60));
//		
////		name: 복정 (수서-48, 장지-66)
////		System.out.println(nodes.get(34).getData());
//		nodes.get(34).addNeighbors(nodes.get(48), nodes.get(66));
//		
////		name: 봉은사 (삼성중앙-38, 종합운동장-67)
////		System.out.println(nodes.get(35).getData());
//		nodes.get(35).addNeighbors(nodes.get(38), nodes.get(67));
//		
////		name: 사평 (고속터미널-11, 신논현-49)
////		System.out.println(nodes.get(36).getData());
//		nodes.get(36).addNeighbors(nodes.get(11), nodes.get(49));
//		
////		name: 삼성 (선릉-44, 종합운동장-67)
////		System.out.println(nodes.get(37).getData());
//		nodes.get(37).addNeighbors(nodes.get(44), nodes.get(67));
//		
////		name: 삼성중앙 (봉은사-35, 선정릉-45)
////		System.out.println(nodes.get(38).getData());
//		nodes.get(38).addNeighbors(nodes.get(35), nodes.get(45));
//		
////		name: 삼전 (석촌고분-43, 종합운동장-67)
////		System.out.println(nodes.get(39).getData());
//		nodes.get(39).addNeighbors(nodes.get(43), nodes.get(67));
//		
////		name: 상일동 (강일-5, 고덕-10)
////		System.out.println(nodes.get(40).getData());
//		nodes.get(40).addNeighbors(nodes.get(5), nodes.get(10));
//		
////		name: 서초 (교대-12, 방배-32)
////		System.out.println(nodes.get(41).getData());
//		nodes.get(41).addNeighbors(nodes.get(12), nodes.get(32));
//		
////		name: 석촌 (석촌고분-43, 송파나루-47)
////		System.out.println(nodes.get(42).getData());
//		nodes.get(42).addNeighbors(nodes.get(43), nodes.get(47));
//		
////		name: 석촌고분 (삼전-39, 석촌-42)
////		System.out.println(nodes.get(43).getData());
//		nodes.get(43).addNeighbors(nodes.get(39), nodes.get(42));
//		
////		name: 선릉 (삼성-37, 역삼-58)
////		System.out.println(nodes.get(44).getData());
//		nodes.get(44).addNeighbors(nodes.get(37), nodes.get(58));
//		
////		name: 선정릉 (삼성중앙-38, 언주-57)
////		System.out.println(nodes.get(45).getData());
//		nodes.get(45).addNeighbors(nodes.get(38), nodes.get(57));
//		
////		name: 송파 (가락시장-0, 석촌-42)
////		System.out.println(nodes.get(46).getData());
//		nodes.get(46).addNeighbors(nodes.get(0), nodes.get(42));
//		
////		name: 송파나루 (석촌-42, 한성백제-74)
////		System.out.println(nodes.get(47).getData());
//		nodes.get(47).addNeighbors(nodes.get(42), nodes.get(74));
//		
////		name: 수서 (가락시장-0, 대모산입구-20, 복정-34, 일원-61)
////		System.out.println(nodes.get(48).getData());
//		nodes.get(48).addNeighbors(nodes.get(0), nodes.get(20), nodes.get(34), nodes.get(61));
//		
////		name: 신논현 (사평-36, 언주-57)
////		System.out.println(nodes.get(49).getData());
//		nodes.get(49).addNeighbors(nodes.get(36), nodes.get(57));
//		
////		name: 신반포 (고속터미널-11, 구반포-14)
////		System.out.println(nodes.get(50).getData());
//		nodes.get(50).addNeighbors(nodes.get(11), nodes.get(14));
//		
////		name: 신사 (논현-19, 압구정-53, 잠원-65)
////		System.out.println(nodes.get(51).getData());
//		nodes.get(51).addNeighbors(nodes.get(19), nodes.get(53), nodes.get(65));
//		
////		name: 암사 (천호-69)
////		System.out.println(nodes.get(52).getData());
//		nodes.get(52).addNeighbors(nodes.get(69));
//		
////		name: 압구정 (신사-51)
////		System.out.println(nodes.get(53).getData());
//		nodes.get(53).addNeighbors(nodes.get(51));
//		
////		name: 압구정로데오 (강남구청-2)
////		System.out.println(nodes.get(54).getData());
//		nodes.get(54).addNeighbors(nodes.get(2));
//		
////		name: 양재 (강남-1, 남부터미널-17, 매봉-27, 양재시민의숲-56)
////		System.out.println(nodes.get(55).getData());
//		nodes.get(55).addNeighbors(nodes.get(1), nodes.get(17), nodes.get(27), nodes.get(56));
//		
////		name: 양재시민의숲 (양재-55, 청계산입구-70)
////		System.out.println(nodes.get(56).getData());
//		nodes.get(56).addNeighbors(nodes.get(55), nodes.get(70));
//		
////		name: 언주 (선정릉-45, 신논현-49)
////		System.out.println(nodes.get(57).getData());
//		nodes.get(57).addNeighbors(nodes.get(45), nodes.get(49));
//		
////		name: 역삼 (강남-1, 선릉-44)
////		System.out.println(nodes.get(58).getData());
//		nodes.get(58).addNeighbors(nodes.get(1), nodes.get(44));
//		
////		name: 오금 (개롱-6, 경찰병원-9, 방이-33)
////		System.out.println(nodes.get(59).getData());
//		nodes.get(59).addNeighbors(nodes.get(6), nodes.get(9), nodes.get(33));
//		
////		name: 올림픽공원 (둔촌동-24, 둔촌오륜-25, 방이-33, 한성백제-74)
////		System.out.println(nodes.get(60).getData());
//		nodes.get(60).addNeighbors(nodes.get(24), nodes.get(25), nodes.get(33), nodes.get(74));
//		
////		name: 일원 (대청-21, 수서-48)
////		System.out.println(nodes.get(61).getData());
//		nodes.get(61).addNeighbors(nodes.get(21), nodes.get(48));
//		
////		name: 잠실 (몽촌토성-29, 석촌-42, 잠실나루-63, 잠실새내-64)
////		System.out.println(nodes.get(62).getData());
//		nodes.get(62).addNeighbors(nodes.get(29), nodes.get(42), nodes.get(63), nodes.get(64));
//		
////		name: 잠실나루 (잠실-62)
////		System.out.println(nodes.get(63).getData());
//		nodes.get(63).addNeighbors(nodes.get(62));
//		
////		name: 잠실새내 (잠실-62, 종합운동장-67)
////		System.out.println(nodes.get(64).getData());
//		nodes.get(64).addNeighbors(nodes.get(62), nodes.get(67));
//		
////		name: 잠원 (고속터미널-11, 신사-51)
////		System.out.println(nodes.get(65).getData());
//		nodes.get(65).addNeighbors(nodes.get(11), nodes.get(51));
//		
////		name: 장지 (문정-30, 복정-34)
////		System.out.println(nodes.get(66).getData());
//		nodes.get(66).addNeighbors(nodes.get(30), nodes.get(34));
//		
////		name: 종합운동장 (봉은사-35, 삼성-37, 삼전-39, 잠실새내-64)
////		System.out.println(nodes.get(67).getData());
//		nodes.get(67).addNeighbors(nodes.get(35), nodes.get(37), nodes.get(39), nodes.get(64));
//		
////		name: 중앙보훈병원 (둔촌오륜-25)
////		System.out.println(nodes.get(68).getData());
//		nodes.get(68).addNeighbors(nodes.get(25));
//		
////		name: 천호 (강동구청-4, 암사-52)
////		System.out.println(nodes.get(69).getData());
//		nodes.get(69).addNeighbors(nodes.get(4), nodes.get(52));
//		
////		name: 청계산입구 (양재시민의숲-56)
////		System.out.println(nodes.get(70).getData());
//		nodes.get(70).addNeighbors(nodes.get(56));
//		
////		name: 청담 (강남구청-2)
////		System.out.println(nodes.get(71).getData());
//		nodes.get(71).addNeighbors(nodes.get(2));
//		
////		name: 학동 (강남구청-2, 논현-19)
////		System.out.println(nodes.get(72).getData());
//		nodes.get(72).addNeighbors(nodes.get(2), nodes.get(19));
//		
////		name: 학여울 (대청-21, 대치-22)
////		System.out.println(nodes.get(73).getData());
//		nodes.get(73).addNeighbors(nodes.get(21), nodes.get(22));
//		
////		name: 한성백제 (송파나루-47, 올림픽공원-60)
////		System.out.println(nodes.get(74).getData());
//		nodes.get(74).addNeighbors(nodes.get(47), nodes.get(60));
//		
////		name: 한티 (도곡-23, 선릉-44)
////		System.out.println(nodes.get(75).getData());
//		nodes.get(75).addNeighbors(nodes.get(23), nodes.get(44));
		
		
//		return nodes;
//	}
	
	public <T extends Node> T findElement(List<T> list, String target) {
        return list.stream()
                   .filter(element -> element.getData().equals(target))
                   .findFirst()
                   .orElse(null);
    }
}
