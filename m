Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6DC7DE87
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 08:44:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46mvDQ17j6z2J;
	Mon,  7 Oct 2019 10:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570437878;
	bh=xQVytlcshKwmubv4fX1F0Tk92Qhj57BxQDhm3k3gUQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RaqZHvF0HdrL7tMZOIXL2i5GUr7J4WmzK4xTeoWzUCDwi9SBx1NQA2Ptmn4neGt3y
	PHFdEH0FQN+DX1hwKPY0TDasgAPvigtS8e52wTv3KbZfwRxKGqY3AviSIGrjf50x5w
	0FAsKCwc9gpjmLJ4hZtWcMpqS03FCSanJXqKIfd8rN8T9O6hhmRdDhcj3eBRa2wVgk
	528Dh8c2nlh3rmhonTP+uefk79OHaEN3/CWtJKNC8w2eYyYvzJEhaRnzCtjaJFGIDz
	px+b9mb3r9DLCrFkCdSrgc41KdYBzWq6PzwaSGtNLQO5x66WyU0KAdbJJXwpU4BGHA
	jkk3TA8TOORzD4J8IOlcp+6Hhd2OO7s2Fm+TUiqGUYqmf8qeZPfomzvXqrtcfNbH3s
	wAa8K1dp4rTjBaeBjfmtcPTLx4d/ATZw/RGmUeTU6M2NTy5qlO8kYw/Z63ty71osJ8
	cMVu/25ipZ2Da3p1IOuShQdJoia171K4TXXUdtJAeDa+QIbZAcEDgaq1W05LlDQMBb
	6rSpp215cBVQKNtI7O67s0jv96IX9Yn4I6cLaodmhInQTl2iKG4swGlkSAK9SynTqS
	NSoXkn4kXcGW9gLvNDVxKnrbrqKTgR9tIZtyuI5v/4bklaqHC/ui6QpYxNUD65WwF1
	azijaMc1QvPYXD1dipB/Z3dg=
Date: Mon, 7 Oct 2019 11:44:35 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Otavio Salvador <otavio@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>
Message-ID: <20191007084435.GB18024@localhost>
References: <20191001121510.1180695-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20191001121510.1180695-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH] modemmanager: Upgrade 1.10.2 -> 1.10.6
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
X-List-Received-Date: Mon, 07 Oct 2019 08:44:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Khem,

this update got lost somewhere?

Thanks
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


