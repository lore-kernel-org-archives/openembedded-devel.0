Return-Path: <rapphil@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 851E06AC35
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Feb 2015 00:28:02 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id 29so4873611yhl.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 16:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=+Jha9mxz5TtBG6R1Yf9we0MhAOczg9XcRFuXPrBIx9w=;
	b=aZ0TFgYSGdGhkMh79v4jNb8//PIN8v7T1y8rfAjNjMP7MO+4kR0CinSuvSNtG/bRxl
	ZC2VXGzivr4FVPJMSZ7Blik0NA+tLPHTxLxANsFa8beVxk7YXACqzkDOVRgQeWnFA4gG
	QOxqm3Cd12+Pe/fN9f1mn44fjuSALjZjZ7dwcro7TRVNWAXllxKDJOLvfzOooj1kaOMY
	3yTMfHnPREhVCh8ApbZwKYqPezIkG4oG/+ZxibmdLFG7UxEBohoMQE+5+SA0FhFPX6tt
	SAcpUKnvsOrlnS2+kTH58dlTgql05UsbazpR280E0XX3CSaX7m813HAf8qsaQzIu736b
	KD/A==
X-Received: by 10.236.110.10 with SMTP id t10mr154441yhg.35.1423182483942;
	Thu, 05 Feb 2015 16:28:03 -0800 (PST)
Received: from gmail.com ([186.222.38.123])
	by mx.google.com with ESMTPSA id y50sm501170yhy.30.2015.02.05.16.28.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 05 Feb 2015 16:28:03 -0800 (PST)
Date: Thu, 5 Feb 2015 22:27:55 -0200
From: Firstname Lastname <rapphil@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150206002755.GA3594@gmail.com>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
	<CAENGNhfzVESxGmQVz3SA6gGv_H+NBE+q9J+FB=Zg1J4WHdg=CQ@mail.gmail.com>
	<CALbNGRQEfMiaVMKVVFnUFdZNokBQ=F5eQCDe7o75H507=uwHvg@mail.gmail.com>
	<CALbNGRRSRUewugNgWeQqguEgHMjmiLetzi=v6rqWXYXy4WJ=Vw@mail.gmail.com>
	<CAENGNhd58fiBF81D6V8H7uSjmmVeVx8-oWU=Pn32OwJs1EStDA@mail.gmail.com>
	<CALbNGRT0r612O8Yn+Vsn-3jCXk8i0yqhAc-Df9ukBiLRV5gRhQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRT0r612O8Yn+Vsn-3jCXk8i0yqhAc-Df9ukBiLRV5gRhQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][PATCH 4/5] qt5-creator: add 3.3.0 of qt-creator
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
X-List-Received-Date: Fri, 06 Feb 2015 00:28:04 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Feb 05, 2015 at 09:34:02PM +0100, Andreas Müller wrote:
> On Thu, Feb 5, 2015 at 6:22 PM, Raphael Philipe <rapphil@gmail.com> wrote:
> > In my local.conf I used:
> >
> >  PACKAGECONFIG_append_pn-qtbase = "accessibility"
> >
> > Attached you can find the log.do_compile for qt5-creator
> You attached log.do_configure :)
My mistake. Here it is: 
https://www.dropbox.com/s/ekuys8g3ud9vet7/log.do_compile.1044.tar.gz?dl=
> 
> Andreas
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

