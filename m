Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S4yGX-0004th-Vi
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 18:33:38 +0100
Received: by lagw12 with SMTP id w12so6523654lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:25:02 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.30.73 as permitted sender) client-ip=10.112.30.73; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.30.73 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.30.73])
	by 10.112.30.73 with SMTP id q9mr12029906lbh.30.1331054702113 (num_hops
	= 1); Tue, 06 Mar 2012 09:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XFQoDPaHiiUhDiakofQTuHeplvWjQVCYlZ2IIGbqYzY=;
	b=yftKFNoFXP82RPQ91INxJan/4JNt5gokXBKFauAFpyabVRVF67gx+EMghDc2JCBlZq
	hbgialUoL7yV3LgENiiQ82jI1hv1Ixirfk5ZJ2EPMB9+6TuF649tdXkG/yd2Vho5TliZ
	e9ShoTlfcjBBgD5norK45gjCFL/BNK1kjYZ9edPojydpyCGEg/A2CdbFeqFGH5XLPk77
	3foJ0PoKSt2PRkiqw9T1ZyR+IAlEOZrLJfEfFHAFnvhwvkdhCnw5GMcGuYMUTeZxVV40
	5l+PVwytvsbzoaUYCnpOFA8QJifobgxUwHFr/4+W5jpIj+txE3OTX03yBhA9VFyNOB1C
	eJfQ==
Received: by 10.112.30.73 with SMTP id q9mr9836950lbh.30.1331054702021; Tue,
	06 Mar 2012 09:25:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Tue, 6 Mar 2012 09:24:25 -0800 (PST)
In-Reply-To: <1331054494-22912-1-git-send-email-raj.khem@gmail.com>
References: <1331054494-22912-1-git-send-email-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Mar 2012 09:24:25 -0800
Message-ID: <CAMKF1srJC1FtZ3W_RPpyuU51is9U9ZB-6QOB9dZm4APg-P5m-Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gcc-4.6: Adjust to match gcc 4.6.3 from OE-Core
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
X-List-Received-Date: Tue, 06 Mar 2012 17:33:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 6, 2012 at 9:21 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Update linaro patches
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Please apply after corresponding patch to OE-Core has been installed.


