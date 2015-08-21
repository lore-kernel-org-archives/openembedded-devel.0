Return-Path: <dean@ripperd.com>
X-Greylist: delayed 491 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Aug 2015 16:04:07 UTC
Received: from resqmta-ch2-09v.sys.comcast.net
	(resqmta-ch2-09v.sys.comcast.net [69.252.207.41])
	by mail.openembedded.org (Postfix) with ESMTP id C025E60557
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 16:04:07 +0000 (UTC)
Received: from resomta-ch2-12v.sys.comcast.net ([69.252.207.108])
	by resqmta-ch2-09v.sys.comcast.net with comcast
	id 7TuP1r0012LrikM01Tvxpc; Fri, 21 Aug 2015 15:55:57 +0000
Received: from mail.ripperd.com ([73.37.153.32])
	by resomta-ch2-12v.sys.comcast.net with comcast
	id 7Tvw1r00H0iBykR01TvwP7; Fri, 21 Aug 2015 15:55:57 +0000
Received: by mail.ripperd.com (Postfix, from userid 65534)
	id 5787C663BA; Fri, 21 Aug 2015 10:55:56 -0500 (CDT)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on apollo.ripperd.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
	autolearn=disabled version=3.4.0
Received: from [10.0.1.6] (unknown [10.0.1.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.ripperd.com (Postfix) with ESMTPSA id 5D6C1663B8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:55:55 -0500 (CDT)
To: openembedded-devel@lists.openembedded.org
From: Dean <dean@ripperd.com>
Message-ID: <55D74A0B.9000004@ripperd.com>
Date: Fri, 21 Aug 2015 10:55:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1440172557;
	bh=kTi9KNoENP5WefRRbVZ+kNDTJMH4yvbWCOvSe5+93OU=;
	h=Received:Received:Received:Received:To:From:Subject:Message-ID:
	Date:MIME-Version:Content-Type;
	b=h5adpAGOuuvSU3IWNrcwGbD4n+9VZbKHfCPRQrmYWaLj+bL8oiS/I5Epit9qpyZga
	vazPbFij5qy8wEQOuyC4dgbNqFuvDT8m3/3IMfGbjHiJMglgZ70qckKalCItv9gawd
	PsjHE9TwIvW8+A+0sqtCV8LW3W8NrH4T43lKbeBIZU+6lIwxlI0IZnEToozcbbJXqm
	XO/vu4nPZ4WorRbg+KpOR1Ej79y38d6NQIyed1837eaRxEKcOlQaDrO/qZeojEpj4V
	aOhqUYOsAORWw4XUGuoXHgLrty+nkB2ssP+lfcpchR7SbavlrR4c3MSZpn6MgdVWzu
	A5AE8y3bj1tNg==
Subject: Openjdk 8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Aug 2015 16:04:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Does anyone have a recipe for OpenJDK 8 JRE yet? I don't see any out 
there other than the one in the meta-aarch64 linaro layer which I don't 
think will probably work for building to arm or x86_64. I am currently 
using OpenJDK 7 from meta-java but plan to use Java 8 features soon.


Thanks,
Dean

