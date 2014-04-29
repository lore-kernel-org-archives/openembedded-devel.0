Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1CB60199
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 18:31:15 +0000 (UTC)
Received: by mail-yh0-f47.google.com with SMTP id c41so401452yho.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 11:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=IWVwa0nPncDOFhzVvmlEvjE1yo+T9AxAj/vQ+NBNes8=;
	b=lOB5s/1r/cS9kL8RBB3uSJiv//UFG+Ir/DFAMtcjI0Zzldd0MjYBN1pJZdhlDqxnZX
	VHacmOFT8rbWsMKc+3dTcyZCQ9STpUirA7769eo0zbbpNsJ0T6XZ4DryIY+TNAXGrczJ
	IDuVQfowrWuge3yuOdPueXYBejCCK6HTQe2B7C04UDgJNxOtUeL+435EXIMsh9t36lID
	QtKE7pYyWfhh8sZQeuYVv9ZK2X04bMC63MVHg9Wc6i4S3nX90zb6ZZ9I5+r2mtVrGY3c
	fSxHk5E/bCDvCwmhzLqF6iOSwrF/6qlKVpfYW6grkcusvkNE5iO5Gmntpm0oRe20YFAg
	AD9Q==
MIME-Version: 1.0
X-Received: by 10.236.189.198 with SMTP id c46mr49954794yhn.47.1398796276003; 
	Tue, 29 Apr 2014 11:31:16 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 29 Apr 2014 11:31:15 -0700 (PDT)
In-Reply-To: <1398753593-4447-1-git-send-email-dv@pseudoterminal.org>
References: <1398753593-4447-1-git-send-email-dv@pseudoterminal.org>
Date: Tue, 29 Apr 2014 15:31:15 -0300
X-Google-Sender-Auth: NCD489aKs0KHa5ekUnw-O9NI9x8
Message-ID: <CAP9ODKrLa_-G6a6UG=MoPrT9wJYUn3zGfSbJ9mqmjMZaZGeYGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH v2 0/4] Introduce EGL/GLES and component build patches for Chromium
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
X-List-Received-Date: Tue, 29 Apr 2014 18:31:17 -0000
Content-Type: text/plain; charset=UTF-8

Hello Carlos,

On Tue, Apr 29, 2014 at 3:39 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> This set of patches extends the chromium recipe to allow for EGL&GLESv2 based 2D rendering,
> considerably improving performance. This also adds hardware-accelerated WebGL support.

Commented in the specific patches with issues/questions.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

