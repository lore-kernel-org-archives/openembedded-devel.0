Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web10.8221.1598335089510164964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 22:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=OjLiArbl;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=499bf77a6=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598335089; x=1629871089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vTqWR4ZR4bKTVWylwbxr/9fSk2bQ6UHSBAXV67ZzOnk=;
  b=OjLiArbl/cCk8lQLscQ2dz6Tl8/NYfcqAxZLyqIJJEFWSPi2Oenjh5Nu
   bSS/vh9C7LgyapqUYdTKY/bnTPgi0KNnfUUXiFkGacmjuwur9H6eOipSd
   y5TimRoTbwxAubUHFTc4B24FMoaDDye9jidj9xrBsHgyUKRjWAQ5mqNHs
   0gS9mF6nucI7MeXNiWhj6hKhsiNCRRqCsU3cUi+LK1trBt+LrecXj+L55
   +wlPwHRs/59fXOIOTGGDbQjTnICyZT71MG1tL6+FLH6X2Acv9hEHEmnzi
   BwoZ0CxPEJtVk13uh4bOPYnwCbjmblffl+7/rMa9owOUL+etJZgqO4pSi
   g==;
IronPort-SDR: Me645r4zkuyzDN7pWdLNCkqB8EqeKaIll3rxOw5O16nEfAYNKx93i6kzXBuvfv4noceFqe55Oj
 gxM/pcg01h+qfz1Hs1PHSXi101PgG9PMLFGin8Ox+J01je0eOrbvda/dQQk5EiomhYvVlsO77F
 FnbeBXO45QQ2yqzRFHEzDUtkKiJZhXbQ3d+StY35CqRLcnsclr76iyzS5M0AA2vUL0QnM4jmYW
 VK63orCwNxk6QZOk372XB+v0dHwh4NmOp3me9vkRe2w6RVHcYTEp46EeOovwZeImKfCmAd6XdA
 LqU=
X-IronPort-AV: E=Sophos;i="5.76,351,1592863200"; 
   d="scan'208";a="2650126"
Date: Tue, 25 Aug 2020 07:58:00 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Jacob Kroon <jacob.kroon@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
Message-ID: <20200825055800.GA37583@pcleri>
References: <20200824062225.GD65616@pcleri>
 <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
 <20200824083345.GG65616@pcleri>
 <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri>
 <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri>
 <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
 <162E2BC2BA50B6B6.12673@lists.openembedded.org>
 <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 24, 2020 at 09:36:42PM +0200, Alexander Kanavin wrote:
> I think the site and the downloads are now properly back.

Thanks for the info and sorry for my misunderstanding regarding the
java.net site.

So you are able to build 8u265 with the current master?

regards;rl
> 
> Alex
> 
