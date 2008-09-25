Received: from [209.85.128.188] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Kir7i-000292-1W
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Sep 2008 15:43:14 +0200
Received: by fk-out-0910.google.com with SMTP id 19so438065fkr.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=3Z6R8Lv10AJWzF9aSFnRmPx7RdSs+ftrl7AKE3PrhLQ=;
	b=GNpNU0G/Jcm2oLqh39DNBiIJBK4vOoFlt1/2cjbYL48QvcRparEIGko199eNpSzsw7
	wgAqE6ARsjUNseAWdSze15umDRCO0WjNIU7YNGRj+Mjy38HNClITrdPUtGw8vQMq28Hw
	FwmNh4K+k0/5fGIruDAsQlXQczFk3zmfYBoz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=WXbkhAdoYu89kURd2h6CFSAiAqKfXT9ru5tytG4n1wTcvOmhh8oo32eJwOrqDre5U8
	MK5g7PrzgVAtvuV73O+R5IZnS9pXVC3K/eNfWimChQIiRyPk6L1eH4ulUKS6iZlx5Ypg
	TJAw1PX+UQEC4iKLYSfDdmFSO3wkGf9qQ49gs=
Received: by 10.187.191.19 with SMTP id t19mr2367430fap.87.1222349972520;
	Thu, 25 Sep 2008 06:39:32 -0700 (PDT)
Received: by 10.187.224.10 with HTTP; Thu, 25 Sep 2008 06:39:32 -0700 (PDT)
Message-ID: <d1b08f940809250639r35958158ue3c1236fcc9c0d0e@mail.gmail.com>
Date: Thu, 25 Sep 2008 15:39:32 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <bug-4581-13@http.bugs.openembedded.net/>
MIME-Version: 1.0
References: <bug-4581-13@http.bugs.openembedded.net/>
Subject: Re: [Bug 4581] New: libqpe-opie and OPIE_CVS_PV/SRCDATE
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
X-List-Received-Date: Thu, 25 Sep 2008 13:43:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Add "require conf/distro/include/preferred-opie-versions-1.2.4-pre.inc"
in your local conf.

http://hentges.net/tmp/logs/irc/%23hentges.net/2008/September/20080912_hentges.net.log

Cheers

Andrea


