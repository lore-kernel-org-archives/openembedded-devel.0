Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mario.goulart@gmail.com>) id 1LxSh1-0004yO-9L
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 23:12:19 +0200
Received: by yw-out-1718.google.com with SMTP id 5so776699ywm.30
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 14:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:subject
	:references:date:in-reply-to:message-id:user-agent:mime-version
	:content-type; bh=/oK/q2HqxLlcDW8juTQHi8swAqOV+T43SEBIugNHDmA=;
	b=jy1k7taqZy2bvXlEn7s5FXrD3xf4YFusgp9q1AQyr9RUVSv/annzD1B21WUB2UnfyR
	2wmO3wYJoUE912acIxwwfN2QR4U3tYwxOoz3mHmDC7YboiqdQhNMoaHk1hkCIbB0hgYY
	7X69b4A6yUh8leIh5ZonoPhhYyCIeI5ANJdYc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	b=HHwf9GFQWBtIEtXdUSFtr+h6RtDfcHHmPrtRxxKS92p0iiQFEhLNtsEuKM/IayJpH0
	lW7knOoPViAdPewa0raLYdGVvk+IY4KyVrLYnsTihjVEZ8QmFiwwKrWjs2VQcOE39176
	Q+0/kXO4fRIpYeVNuBQ5U7hXLFXKuVkhfu2/4=
Received: by 10.100.213.18 with SMTP id l18mr3873148ang.37.1240607253085;
	Fri, 24 Apr 2009 14:07:33 -0700 (PDT)
Received: from nachos.gmail.com ([189.30.52.126])
	by mx.google.com with ESMTPS id c1sm892454ana.7.2009.04.24.14.07.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 24 Apr 2009 14:07:32 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@openembedded.org
References: <878wlp2275.fsf@ossystems.com.br>
Date: Fri, 24 Apr 2009 18:07:25 -0300
In-Reply-To: <878wlp2275.fsf@ossystems.com.br> (Mario Domenech Goulart's
	message of "Fri, 24 Apr 2009 18:04:30 -0300")
Message-ID: <871vrh222a.fsf@ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.60 (gnu/linux)
MIME-Version: 1.0
Subject: Re: User Manual: IPKG_INSTALL
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
X-List-Received-Date: Fri, 24 Apr 2009 21:12:19 -0000
Content-Type: text/plain; charset=us-ascii

On Fri, 24 Apr 2009 18:04:30 -0300 Mario Domenech Goulart <mario@ossystems.com.br> wrote:

> Chapter 9 from the User Manual mentions the IPKG_INSTALL variable (items
> 6 and 13 from the "rootfs_ipkg class" section).  I can't find this
> variable in rootfs_ipk.bbclass.  Shouldn't this variable be
> PACKAGE_INSTALL instead?

For the reference:
http://docs.openembedded.org/usermanual/html/rootfs_ipkg_class.html

Best wishes.
Mario


