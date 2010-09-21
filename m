Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Oy9aW-0005O3-JS
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 22:37:18 +0200
Received: by bwz2 with SMTP id 2so5848786bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 13:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=KzmNrRMMOpHBabBKBRF9RLpMBieJBgJq8jNqLFhL7Qo=;
	b=h0NHpxJD/NgXEttUSt1vWGpyoYB88M7Qg1KBmmfGt4wPk9JxRJt1kvT/Wi8vfwBqKj
	VFsW875m7mCKGIGEJ3QPSfa36CSUkfjevW/5fd2nsaH+0a2sNCvaRPt30Nt0vVJYZhKL
	yikBcv17aJFBX3BAvSwX8pyMQOi3BrHKaxXWE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=WZLhOC5ZOg+qN33XgMI25Pwq305VwFoh88ijbbGrXeDv213IstAkzuHt0utQaWeaci
	WcE8+lqwDF0mLL2E6xMmxc46hYBUgCNjYotaHx7IBcz1i66O52FbcmIbAn7TKaxBwaXQ
	E/IIWLMdhlJU4TLLDtT1uayrln4rXnC/JspZg=
Received: by 10.204.68.136 with SMTP id v8mr8185620bki.88.1285101430996;
	Tue, 21 Sep 2010 13:37:10 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f16sm7956979bkd.16.2010.09.21.13.37.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 13:37:09 -0700 (PDT)
Date: Tue, 21 Sep 2010 22:37:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100921203711.GF3403@jama>
References: <AANLkTikDibG-qAf2b9U_OuOLbVXNP8QWouTEN7z_v25_@mail.gmail.com>
	<20100921152505.GB3403@jama>
	<AANLkTikTrRMX-5UAso2BgJ8-XqhwtXTnS_vT2Yt4FNnc@mail.gmail.com>
	<20100921154038.GC3403@jama>
	<AANLkTim9cs7=eKAV1T2ZWTd1HgAaXrxDUdcLUT8RahUF@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim9cs7=eKAV1T2ZWTd1HgAaXrxDUdcLUT8RahUF@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: anyone working on recipes for qt 4.7.0 released?
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
X-List-Received-Date: Tue, 21 Sep 2010 20:37:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Sep 21, 2010 at 04:26:06PM -0400, Cliff Brake wrote:
> On Tue, Sep 21, 2010 at 11:40 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Tue, Sep 21, 2010 at 11:34:23AM -0400, Cliff Brake wrote:
> >> On Tue, Sep 21, 2010 at 11:25 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> > On Tue, Sep 21, 2010 at 11:21:32AM -0400, Cliff Brake wrote:
> >> >> Qt 4.7.0 is now released:
> >> >>
> >> >> http://labs.qt.nokia.com/2010/09/21/qt-4-7-0-now-available/
> >> >>
> >> >> Is anyone working on recipes for this yet?  I've been trying to get
> >> >> 4.7.0-beta2 to build, so wondering if anyone has tried 4.7.0 released
> >> >> yet.
> >> >
> >> > 4.7.0-beta2 is building and working for me (SHR) fine, but no time to
> >> > work on 4.7.0 now, so would be great if someone else does that.
> >>
> >> Just to verify and get a baseline, what all do you need to set to get
> >> 4.7.0-beta2 to build properly.  I'm trying:
> >>
> >> ANGSTROM_QT_VERSION = "4.6.3+4.7.0-beta2"
> >
> > Yes, I also had to use newer postgresql before (not sure if it's still
> > needed).
> >
> > http://gitorious.org/~jama/angstrom/jama-shr-experimental/commit/5fcd20c6e939edfec27fccce1e92f82cf0a78b17
> >
> >> Are you using the X11 or embedded version or Qt?
> >
> > only X11 version
> 
> X11 version built fine -- qt4-embedded failed:
> 
> http://bec-systems.com/oe/qt4-embedded-log.do_compile
> 
> We'll move on to the 4.7.0 released stuff next.

Looks like same issue as with demos/browser fixed in:
recipes/qt4/qt-4.6.3+4.7.0-beta2/demos.browser.add.mediaservices.lib.patch

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


