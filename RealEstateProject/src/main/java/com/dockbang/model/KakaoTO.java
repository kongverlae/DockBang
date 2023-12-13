package com.dockbang.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@AllArgsConstructor
@Builder
@Getter
public class KakaoTO {

    public String accessToken;
    public String refreshToken;
}
