package com.dockbang.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//그래프의 각 노드를 표현하는 클래스
public class DijkstraNode implements Node{
    String name;
    DijkstraNode parent;
//    String line;
    // 환승 시간체크를 위해 리스트로 구현
    List<String> lines;
    Map<DijkstraNode, Integer> neighbors; // 이웃 노드와 가중치를 저장하는 맵

    public DijkstraNode() {
    	this.neighbors = new HashMap<>();
    }
    
    public DijkstraNode(String name) {
        this.name = name;
        this.neighbors = new HashMap<>();
    }
    
    public void setName(String name) {
    	this.name = name;
    }
    
    public void setLines(List<String> lines) {
    	this.lines = lines;
    }
    
    public List<String> getLines(){
    	return this.lines;
    }
    
    public void setParent(DijkstraNode parent) {
    	this.parent = parent;
    }
    
    public DijkstraNode getParent() {
    	return this.parent;
    }
    
    // 이웃 노드 추가
    public void addNeighbor(DijkstraNode neighbor, int weight) {
        neighbors.put(neighbor, weight);
    }
    
    @Override
    public Object getData() {
    	return this.name;
    }
    
}
