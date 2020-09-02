Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.3000.1599036237650483661
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=lJz28oLH;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=507acaa50=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1599036237; x=1630572237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lv6OQuAAWkb1N0TNCriBLEXNjP+Fvx21ZS0TeQgU1e4=;
  b=lJz28oLHHyfGm5JKyBz16hfUWeepy2i5tdMOhJRSqj0Lfmfzgnp6S/Ep
   +zFusGYXNih2bD66WJ4maj6QTKp+z5xGuohjo4V9elSG/TOVznbUck9eY
   AQhB/rT565+k779aD5TnWsviGPLD1jAEM+cCutTEqAK9vw3SKtOA0sdhr
   BM86xqtSK2+x+UKJs5QBSPiS8Ot6i/91arCm5omNhW/uvhon/tpnG0tpu
   nezzFJK7EgGeBy5Xec44XLZ0FvkyUCs7E5W1mXZDcWpSJjP4RBAHHV7Ys
   +E3jIK2uo2w3zckI/I4LRI/oV79/g9x2CfLdTVGWRjEbxFsq3lBNxvkiP
   Q==;
IronPort-SDR: VE6i9HNz1Pi6V0prmjL8qxVrJm7Z71UcJpgXDoqntMBf0iuEGfCuBJoGNXFoxyzUX2CpvE3vX+
 3dX9516t9+eSw8Y8TY7hOTOjeuoaGjap4iDx8sCHLWXJFwXv0F5HLDIBsgR2IPr5t6flwFNqaI
 ROPmPZZptHYVqfuTj24SvqlsyvB8uf1ely8i37fWrIZ3xp3sSnRo3+oVreeXXnc9WAlmglazKX
 ejoM5mjL0TzWFzMspR2WfvtXZmCB0aWrbZdHtQMh+ie5sccDy4EDJmCsA82NtNTJrLgqWeWElq
 2iM=
X-IronPort-AV: E=Sophos;i="5.76,381,1592863200"; 
   d="scan'208";a="26541719"
Date: Wed, 2 Sep 2020 10:43:48 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Jacob Kroon <jacob.kroon@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
Message-ID: <20200902084348.GB81961@pcleri>
References: <20200824091401.GB2286@pcleri>
 <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri>
 <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
 <162E2BC2BA50B6B6.12673@lists.openembedded.org>
 <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
 <20200825055800.GA37583@pcleri>
 <CANNYZj-n4T1bkX4k36B5LgG+7nJANO+sVKGXbyf1mFZTMx-t1Q@mail.gmail.com>
 <20200825110343.GE37583@pcleri>
 <CANNYZj-a5HeUKExws6KNoofbPy4EQmmzx=2-ZtsD+N8j70g-HQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-a5HeUKExws6KNoofbPy4EQmmzx=2-ZtsD+N8j70g-HQ@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Aug 30, 2020 at 10:46:06PM +0200, Alexander Kanavin wrote:
> On Tue, 25 Aug 2020 at 13:03, Richard Leitner <richard.leitner@skidata.com>
> wrote:
> 
> > Great. Thanks for the feedback.
> > dunfell-next and warrior-next are already available. I'll merge them to
> > the real stable branches soon.
> >
> 
> ping - I think dunfell is still at the old revision?

Thanks for the reminder.

dunfell and warrior should be up2date now.

regards;rl

> 
> Alex
