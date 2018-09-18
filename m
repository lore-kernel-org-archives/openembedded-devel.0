Return-Path: <jaragunde@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9FE74535
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2018 14:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=TDxxOmhTP0N5IgXq8rULj8hRP/qE/g5UhM9pecxJcuc=; 
	b=Tdd28EpiKlRJrj+o2lR5TBUEHFbLa4RFklttg7nmEU7Hd2mhRSfsksZb2BTt4AJ7obP6BNaOtLbv5YWCq19Rcpj1nyGCYTkKtZCyMb8GgY0VTc/vWa63ZG2Mk119tPN1xxDEWVyjojXHuBMo65NEx9IZLg4DgNX+j+iTAq2HhiPVlpCtaCMVaU2+5avjnF8hUxEJ47CYH5pJd8L36oJKSSgefDzHYD+HK3eQVEt9nRlqhp9qWfF5d/bLJiO0y7ySt0Yj2CAm/CgL2jbvI9zgMyBRadfMjDNanS1Orl3b7Mvwsloui0yBkRUEqrONJp5VYFP5bRZqKvzsjenFS/VnZA==;
Received: from [139.47.3.135] (helo=[192.168.1.81])
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1g2H13-0002oq-U5; Tue, 18 Sep 2018 16:30:14 +0200
To: openembedded-devel@lists.openembedded.org
References: <20180918121015.128142-1-jaragunde@igalia.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <366377b4-4210-880f-b2aa-003cfdc8f17e@igalia.com>
Date: Tue, 18 Sep 2018 16:30:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180918121015.128142-1-jaragunde@igalia.com>
Subject: Re: [meta-networking][PATCH] tinyproxy: upgrade to version 1.10.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2018 14:30:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

I noticed a warning in the logs after having sent the patch. Will post a 
new version. Sorry for the noise!

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia

