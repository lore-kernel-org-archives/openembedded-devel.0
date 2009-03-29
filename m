Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Lo3WX-0005Qk-Ty
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 00:30:37 +0200
Received: by fxm20 with SMTP id 20so1653428fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2009 15:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AsYlkto372AWunsqX/IoLQeOVwvQ+U9XEe8dWtRBF94=;
	b=M8qXgR868qHyBIht2sQmBTgEJg8aTz0L8HUGdm4bgssDeCsJvAmBkCSxZLJqGvxKYz
	pCqetH6KRaenKV15oo5xJO1Q1J9sjFEsxiLTK1lsCv2US9ahYbZYtCN5veopJFljwLz2
	wkKj3wjIKob1auTPMRm5bBFGhYwWiO4h73QKM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=k6q/8IPfGLkFxUEjToBTDdKMseULHcFejQXpA7ZO+tem+ZFJpIkJJNs9LHBMUExK5E
	5zfAb++pFdgXqqJrhrcam3DSzd0AyutRoRAxgdpaTRYc3Wul3feLK349qKXcrtQDDaY8
	mHkkJWB25jjSdAKgBCvveCX2VQl2rRotUjKfY=
MIME-Version: 1.0
Received: by 10.223.103.133 with SMTP id k5mr275118fao.23.1238365713635; Sun, 
	29 Mar 2009 15:28:33 -0700 (PDT)
In-Reply-To: <fce2a370903030755n133906a3i32a25df5390d537@mail.gmail.com>
References: <1233319034.13141.2.camel@EPBYMINW0568>
	<fce2a370902030302m1054bfc5wc5589ed60418c959@mail.gmail.com>
	<gm99v0$ier$1@ger.gmane.org>
	<fce2a370903030755n133906a3i32a25df5390d537@mail.gmail.com>
Date: Mon, 30 Mar 2009 00:28:33 +0200
Message-ID: <d1b08f940903291528i4fcd7139rc7d3cee88dd315d5@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Automate uboot entry/load addresses detection.
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
X-List-Received-Date: Sun, 29 Mar 2009 22:30:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, I've tested the patch and it seems to work.
Thanks

Andrea


