Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 761 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Apr 2018 10:33:50 UTC
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.205])
	by mail.openembedded.org (Postfix) with ESMTP id E70A77458C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2018 10:33:50 +0000 (UTC)
Received: from [216.82.242.45] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-13.bemta-8.messagelabs.com id 67/17-08494-61FB9DA5;
	Fri, 20 Apr 2018 10:21:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsXi5LtOQFd0/80
	ogw2HjS0a9uZYXDy8lNmByePcxhWMHn+bJjEHMEWxZuYl5VcksGa8bfnGXDCftaLxlHgD406W
	LkYuDiGBVYwSDXNmM3cxcgI5ixklpq03BbGFBcIljtx9zA5iiwjESFy4t4O1i5EDqMZRon2eH
	kiYTUBPYvKlJ2CtvALWEg3X37CC2CwCqhJ3f3xhAbFFgcYsuLqFDaJGUOLkzCdgcU4BJ4mG2c
	fA6pkFLCRmzj/PCGGLS9x6Mp8JwpaX2P52DtRpKhIHl14Gq5EAim/afJZ9AqPALCRjZyEZNQv
	JqFlIRi1gZFnFqFGcWlSWWqRrZKmXVJSZnlGSm5iZo2toYKGXm1pcnJiempOYVKyXnJ+7iREY
	xPUMDIw7GH8ciT7EKMnBpCTKe2zyjSghvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxv9t6MEhIsS
	k1PrUjLzAHGE0xagoNHSYR3D0iat7ggMbc4Mx0idYpRl+PE+yk9zEIsefl5qVLivB9BigRAij
	JK8+BGwGL7EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXq59QFN4MvNK4Da9AjqCCegIA5U
	bIEeUJCKkpBoYO6zD7CNsDp29rPt1VuNWrR+3C33fLL7XccDF2vnMnMBWzfov9/R3sJ41uzdz
	TbpVgJNdbpLoMT1vlTnzNmwKXqsYdv9/dUc1jzDPzvS+M5MPLwmeFVZQstNb1rBW8Gt4wq4JB
	3S2uXfsXtfPXFi05yP3Gq5NV2qYGKKelbCwLduY9eBAivIvJZbijERDLeai4kQAF4j0degCAA
	A=
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-5.tower-201.messagelabs.com!1524219669!37018805!1
X-Originating-IP: [66.77.174.16]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.9.15; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1626 invoked from network); 20 Apr 2018 10:21:09 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-5.tower-201.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 20 Apr 2018 10:21:09 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 20 Apr 2018 05:21:09 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 20 Apr 2018 12:21:06 +0200
To: Adam Trhon <adam.trhon@tbs-biometrics.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180419130701.1713-1-adam.trhon@tbs-biometrics.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <7888fc9d-2546-8de2-8df7-2aa62015d0de@digi.com>
Date: Fri, 20 Apr 2018 12:21:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180419130701.1713-1-adam.trhon@tbs-biometrics.com>
X-Originating-IP: [10.101.2.54]
Subject: Re: [meta-qt5][PATCH] qttranslations: annihilate qttranslations-qtconfig
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
X-List-Received-Date: Fri, 20 Apr 2018 10:33:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19/04/18 15:07, Adam Trhon wrote:
> In Qt 5.9.5 there is no qtconfig translation (see commit a6b3446cb023
> in qttranslations upstream). But packagegroup-qt5-toolchain-target
> RDEPENDS on qttranslations-qtconfg, which breaks SDK populating.
> 
> Fix this issue by annihilating qttranslations-qtconfig from meta-qt5.

+1

This is needed also in Rocko after the update to version 5.9.5.

Currently Rocko fails to build a QT5 based SDK with:

Error:
  Problem: conflicting requests
   - nothing provides qttranslations-qtconfig needed by 
packagegroup-qt5-toolchain-target-1.0-r0.0.noarch

Cherry-picking this patch fixes the broken build.

-- 
Regards,

Javier Viguera

