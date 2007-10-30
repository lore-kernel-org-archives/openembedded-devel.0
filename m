Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dbaryshkov@gmail.com>) id 1Impe7-0008DH-ED
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Oct 2007 12:52:35 +0100
Received: by py-out-1112.google.com with SMTP id a25so4099006pyi
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2007 04:52:30 -0700 (PDT)
Received: by 10.65.213.4 with SMTP id p4mr15233439qbq.1193745150480;
	Tue, 30 Oct 2007 04:52:30 -0700 (PDT)
Received: by 10.64.233.15 with HTTP; Tue, 30 Oct 2007 04:52:30 -0700 (PDT)
Message-ID: <bc64b4640710300452o2fee244dm45d14a5196ff34d7@mail.gmail.com>
Date: Tue, 30 Oct 2007 14:52:30 +0300
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <0ML31I-1ImoSa1Taq-0003f0@mrelayeu.kundenserver.de>
MIME-Version: 1.0
References: <bc64b4640710300320h63a90f80tc9ceca9d4340e994@mail.gmail.com>
	<0ML31I-1ImoSa1Taq-0003f0@mrelayeu.kundenserver.de>
Cc: dirk@do13.de
Subject: Re: Update Tosa kernel patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2007 11:52:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

2007/10/30, Dirk Opfer <dirk@do13.de>:
> thanks for the patch.
> I recently started working on refreshing the patches for 2.6.23. I'll
> integrate your patch.

Good news :)

>
> The usb part isn't easy, because the usb maintainers removed some hooks
> which are essential for the tc6393.

Oh. and btw: are there any datasheet/docs for tc6393? Or the best
sources for the information are usb_ohci_tc6393 from Cacko and
tmio-ohci.patch?



-- 
With best wishes
Dmitry Baryshkov


