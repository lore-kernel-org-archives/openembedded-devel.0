Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1M2pRv-0007i3-36
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 18:30:55 +0200
Received: by yx-out-1718.google.com with SMTP id 36so1238269yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 May 2009 09:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=K5irRRiIWOsAtbot3dv+AXoNR2F11tVGgBo0ZuWRFLY=;
	b=Szu49pR/IsFS8EsmvCBYMPXo7F6HHdxaC58rNqhbUhcJREIoEDXApKssVHM8hq6Le3
	aCt+EhG6ekD/c3g+pdwxvFF6Bf107mVwGt/k97/H7WS2HZYW4ZYjo4bs7U6RIIgGLG4W
	aXBruKOFMFWjZSWnRNOQZ9D+TFDc3GWVYIOZg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XFmP3Mxrkk9tlQmPLlqze1OqwMjydqDWfHpyQJJPECzRgEMZvYXvWXRGExcryQKOTz
	3MFLeFZ+3ruFBofUgOg1b4K46A7AIdoQxJlMXEo6pWZEmfh7BC0WRCzLDm1bl5OvFnAW
	3a8Ol9m8plcVpyB1TCLFGoa+FQl2R/aLQnyo8=
MIME-Version: 1.0
Received: by 10.151.47.20 with SMTP id z20mr2353385ybj.294.1241886275362; Sat, 
	09 May 2009 09:24:35 -0700 (PDT)
In-Reply-To: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
Date: Sat, 9 May 2009 12:24:35 -0400
Message-ID: <f96d234e0905090924r43ae4284q56fa52b591cbb234@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Ready to commit patches from O.S. Systems
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
X-List-Received-Date: Sat, 09 May 2009 16:30:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2009 at 8:50 PM, Otavio Salvador <otavio@ossystems.com.br> w=
rote:
> Hello,
>
> We'd like to push those patches into dev tree and want some review on
> them. I'd also would like to hear advices about:

Looks good.

> =A0 [PATCH 11/23] cups: split backends and models

Seems like a good idea to me.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


