Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKmXf-0005E3-KT
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 08:07:36 +0200
Received: by fxm9 with SMTP id 9so1227896fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 23:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=xGJT/gSdj7TgKm2HniJ+eoPvxCT2BgHgvhI3J4pdkOI=;
	b=YWRozhwK3jPEKBJeqlhQbVCYnWLBVov2kpm6T5Qf5R/++i4IlKcvywwDZ53UwbJZXC
	GP8cS123bXrZSFIA/+FVsYjmWywWsYLQhVm9jhwlloYISkmsgHuEJU3ySjcd5mZKnRn4
	QS84xx59SLKuySayx9xrRL6jx11yAyhp1aIPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=nl2ekMjLTv6TbLxfMmTjKjZuEHJPL65dYg1FbFcGO1uaHrQWk8Brt462yrk/WL91gA
	CynQyjgzV73/soxU577alKoVITsu9bZsBguEd6AcwF0F+SJgdVFJofKBPoYhNDUY6Thr
	th8cJ4hSEcP9OxZwy8lJV8R4NKUuban0ly9Ns=
Received: by 10.223.23.83 with SMTP id q19mr12717172fab.12.1275717798268;
	Fri, 04 Jun 2010 23:03:18 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm8839936fah.16.2010.06.04.23.03.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Jun 2010 23:03:17 -0700 (PDT)
Date: Sat, 5 Jun 2010 08:03:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100605060300.GS16035@jama>
References: <4C0992ED.6000102@gmail.com>
 <hucovl$sbi$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hucovl$sbi$1@dough.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: qt4 upgrade to 4.7.0-beta1
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
X-List-Received-Date: Sat, 05 Jun 2010 06:07:36 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Jun 05, 2010 at 07:57:09AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 05-06-10 01:57, Matthias Günther wrote:
> > Hello.
> > 
> > I've been working with QML (Qt Quick) for some time now and therefore
> > I've created recipes for Qt 4.7.0-tp and beta1 versions. The patches
> > just disable the not cross compiling parts (e.g. some demos/examples).
> > 
> > Should I send the beta1-patch to the ML or is it better to wait for the
> > final release?
> 
> Please send them to the list so we can work out issues before the
> release happens.

Matthias: please confirm if they will be the same as you have in 
http://gitorious.org/~matgnt/angstrom/matgnts-openembedded/commits/qt-4.7
or create reabased branch there, it will be easier for some testers to
try your changes :).

Thanks

Regard,

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


