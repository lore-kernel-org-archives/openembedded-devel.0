Received: from mail-vb0-f42.google.com ([209.85.212.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URfqE-0003X1-16
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 11:36:58 +0200
Received: by mail-vb0-f42.google.com with SMTP id p12so3622750vbe.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 02:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=gYq0rEoV0aYrkuPlACf+jyv083l/L29ZBwbeYkHn1fc=;
	b=T5UcQtD4k+3V6ovApA7MZPoAA7f2OexjBlMVmI8+iF8KEbl2pk+pGVSGHfwe2ZighS
	R5xgIlF3CRDJ2KYjYtTELOCNDFZ1QM1TG6ZR3L76c865XHA7EslyiWsw1LK4a271yGU2
	ZURCgdNIzhy3144K7Nj9qassM87f7IAcs/GHFrcxhOLKmA7uayytWamd32b1oDI89E/2
	5Q91WRCkRCze4gVyRlrzTgqTdbdaB1nIMXj2q+bibcd/miMxEpU637Clnf8CmqdpL82H
	f7wbgbABXUokPrUuakznK9kIuVMPMttv7Y7hs+JE4q296Yej1hMkOq23j9IbkFoxtRj8
	WefA==
X-Received: by 10.52.23.115 with SMTP id l19mr13237625vdf.55.1366017560938;
	Mon, 15 Apr 2013 02:19:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 02:19:00 -0700 (PDT)
In-Reply-To: <1365867474-10261-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365867474-10261-1-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 10:19:00 +0100
Message-ID: <CAJTo0LZEwOb+u0=aR+BnozYTZ1n0GOO2_e3Na1WW3C6ApNk3Rw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQn4OcdO6Z4VwV/Fqv6g+zPaMoF7ixiP4IIpnchZTxsAFG+g+qu5ToX1KutizSUjF44DhZUq
Subject: Re: [meta-oe][PATCH] llvm: Import from meta-java
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
X-List-Received-Date: Mon, 15 Apr 2013 09:37:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

On 13 April 2013 16:37, Martin Jansa <martin.jansa@gmail.com> wrote:
> * llvm is generic enough to be useful outside meta-java
>   e.g. we need it to enable llvmpipe galium driver in mesa

Do you plan on doing this?  I've had this down as something to propose
for oe-core, or at least enable elsewhere.

Ross


