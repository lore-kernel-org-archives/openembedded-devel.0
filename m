Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web11.8164.1598335633553081812
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 23:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=I0RW/EWu;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=499bf77a6=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598335633; x=1629871633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=phJb1xCdMmC4kYrvcvMLh0z0rrZriZHPJmixI/CAL+Y=;
  b=I0RW/EWuWAckL5i6spmRdjydeHJtH0bXh0hvH0WibRxQW9ZW99SOgXfa
   OoVwkBMOksTM17VDmdo7QxV7xbzz64NBZ8DflZ0LmBvyY+joQ/1oUHqmh
   1LRYIEwNMwWu52oG/IFliG4ftnd3aX3W1JGsDTx1bHfluzzGqQSkcOOjs
   jbeOSuljbXyEPVbG8m+P/VnQmu2uNeUm6btQ37rYFWLuDCsoAvPD/tWMN
   D2IMEJoptciZpbQHNJBskAlFheR/HWuRB9TTe9FLgBRDu1Pr6Qq8Zequ7
   IKYzYVMQToKo2qlnm3KNVWpeIr44ZpStOfKjsqpgi5lmuryrV122Fo5mo
   Q==;
IronPort-SDR: MdT0aKfpjagdLxxyMSE3UXyGm/gOmxl4//vwviNyi9ZLzKnymvrcxLCN2pxVPHjuv0LQBtOB9Y
 4RkmeMZPxjNjEp5Ukq3faFjrMadxoZ35blCrgjwx9VjEchZFgD346t1/vqjWrNiyOqPkRUh0Gz
 NjDyDFTZVCdVwtie4JWFnQ3sKiaSwMVkljezQAV6SQTcEbu+/3X2AUI8ooYcg2f7NpaBpUXczd
 8vdCQSwYn5YD3LbZEUGnMmfu3SgDhe6pCzc29scM8Y1qeUFDnDs72ebiyrsLlXNttU/FPPtAKb
 CWg=
X-IronPort-AV: E=Sophos;i="5.76,351,1592863200"; 
   d="scan'208";a="26351146"
Date: Tue, 25 Aug 2020 08:07:10 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
Message-ID: <20200825060710.GB37583@pcleri>
References: <20200824083345.GG65616@pcleri>
 <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
 <20200824091401.GB2286@pcleri>
 <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri>
 <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
 <162E2BC2BA50B6B6.12673@lists.openembedded.org>
 <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
 <20200825055800.GA37583@pcleri>
 <1e7c4c2f-d332-de8d-42d4-83614b6266ec@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1e7c4c2f-d332-de8d-42d4-83614b6266ec@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Aug 25, 2020 at 08:05:56AM +0200, Jacob Kroon wrote:
> On 8/25/20 7:58 AM, Richard Leitner wrote:
> > On Mon, Aug 24, 2020 at 09:36:42PM +0200, Alexander Kanavin wrote:
> > > I think the site and the downloads are now properly back.
> > 
> > Thanks for the info and sorry for my misunderstanding regarding the
> > java.net site.
> > 
> > So you are able to build 8u265 with the current master?
> > 
> 
> I can build master now. Must have been temporary server problems as you
> stated. Sorry for the noise.

Great. Thanks for the feedback 👍

regards;rl

> 
> Regards
> Jacob

