Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pp6xb-0000B5-4F
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 23:31:59 +0100
Received: by ywi6 with SMTP id 6so2265403ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 14:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=bdoPyf69rKFLyQ9MD/0+7W89egNm9CWxyF8ehyRc4Q0=;
	b=gF0GSwexdUZwN0v7OTuu/ZqpiRsE7S3QV/IcVvYttMSe/Sn1WxidgjubF2mnd++p/r
	GitTJzOTtIQAq2aGhLV4Ny1oaHolUthdKhOM40u1kfBcuLIwGoCSElyurkpkbehD5tw5
	LeB/VcymJvzZ9Pp0bHG2Jpkr6t6OdxGWTHzpA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=Fm3V55AD2DVD/E+4ceB0iu9NppUh4ZNKBy9wlyyjzn96QSzNnXCvPkmHP7rtEO3PHg
	FpkjgrcNsrUlCCMA+Xtp4rhSzI/TjHSvOs61kPI5qoN+gplp4f5bgH18oOsOGrGW1iSn
	QhjulMVhUxNKH2DiUOWsM23B3cV++zU8l2pNU=
Received: by 10.236.109.166 with SMTP id s26mr2224615yhg.76.1297722646057;
	Mon, 14 Feb 2011 14:30:46 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d64sm607877yhh.42.2011.02.14.14.30.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 14:30:45 -0800 (PST)
Date: Mon, 14 Feb 2011 14:30:28 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110214223028.GA20605@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4D5961E8.3090801@mentor.com>
 <4D597E62.9030301@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4D597E62.9030301@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Run-time testing of testing-release-2011.1
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
X-List-Received-Date: Mon, 14 Feb 2011 22:31:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (14/02/11 12:11), Gary Thomas wrote:
> On 02/14/2011 10:10 AM, Tom Rini wrote:
> >Hey all,
> >
> >If you have a machine that's listed over here with a blue icon, please contact me off list if you would like to perform run-time testing of any image(s), along with how you want me
> >to share them with you:
> >http://i.imgur.com/Cbakj.png
> >
> >(And I'll post pastebin'ing failure logs for stuff I can't easily fixup myself throughout the day, then updating the wiki page, but as you can see, it's a large dataset).
> >
> 
> I'd be glad to test any beagleboard combo.  I can give you
> an FTP site to download images or pull them from you.
> 
> BTW, I tried to build MACHINE=beagleboard/DISTRO=ansgtrom-2010.x
> which failed.  I looked at
>   http://wiki.openembedded.net/index.php/Release-2011.03
> but it wasn't obvious where/how to report the failure.  Also
> that page doesn't seem to be very current?

you should report failures to mailing list may be prefix the subject
with Release-2011.03 to make more clear
-Khem



