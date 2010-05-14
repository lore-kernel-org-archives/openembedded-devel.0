Received: from mail-yw0-f193.google.com ([209.85.211.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OCwOS-000837-N9
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 17:01:42 +0200
Received: by ywh31 with SMTP id 31so1224731ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=t1ivE+QjazNS33ZoSvj7Grk/NSCoh3UkNf1r1WdOBLE=;
	b=Mi/lAzDNto/S0yRUHR7mz4JTVZAN25Y2yGOFH12Sz0JqYPJAcoqKhGVmmPUXjdWr3m
	QdNLnydVNMTsyTnzisipn3/JdRXKuTicfYQ5aJkpyeVh/tfS64VyIX7+dtep5V0HZYe+
	LYXUhf83A/IygqC8ADME4rL7epCw91xCjQuH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=B+4rx/zYnEaOMFxDD3IQrk22mWpEzqT0JvaHfaJnRkOjhDoaPYCOM5LWB/hSrvPSzP
	xxG/psxtlF38SRn3gSGOd22XZe6OaXRWXcBQn/4+3UzkJBxz+YOch48LglrIDqzXgs8l
	sSFn8ZtuDgcPq2Q+/s6Dc6gowh/TD1fb72aaQ=
MIME-Version: 1.0
Received: by 10.229.213.136 with SMTP id gw8mr354725qcb.193.1273849063888; 
	Fri, 14 May 2010 07:57:43 -0700 (PDT)
Received: by 10.229.230.77 with HTTP; Fri, 14 May 2010 07:57:43 -0700 (PDT)
In-Reply-To: <20100514122113.GH3507@excalibur.local>
References: <1273758399-23601-1-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-2-git-send-email-aalonso00@gmail.com>
	<1273758399-23601-3-git-send-email-aalonso00@gmail.com>
	<20100514122113.GH3507@excalibur.local>
Date: Fri, 14 May 2010 09:57:43 -0500
Message-ID: <AANLkTikEcvXMhSbq1ZxiCibA33s_O5tfce9vqFNzXEMb@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.193
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 3/5 v2] linux-xilinx-ml507: update kernel version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 May 2010 15:01:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks,

I will rework patchs and resend them asap.

Regards

On Fri, May 14, 2010 at 7:21 AM, Stefan Schmidt
<stefan@datenfreihafen.org>wrote:

> Hello.
>
> On Thu, 2010-05-13 at 08:46, Adrian Alonso wrote:
> > * Update kernel version 2.6.33
> > * Include xilinx framebuffer patch
>
> You need to reorder your patchset to have the fb patch prior to this
> change.
> Without this git bisect will break.
>
> Looking over the patch I think it would be fine to have it merged into this
> patch as well. Small enough.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

