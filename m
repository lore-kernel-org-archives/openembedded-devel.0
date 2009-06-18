Received: from [209.85.210.188] (helo=mail-yx0-f188.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MHL0q-0006Rw-4M
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 19:02:56 +0200
Received: by yxe26 with SMTP id 26so69020yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2009 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=yW5PBhTdNUrgLvrA2Hnl+vUPS+kYrT2Qk92TTd9Lyu4=;
	b=TZH6iAHQyGD1Qr4aLukH+CZFkF+646NXLg5ho86DfGjnq90A/PkE25vJLlGUpH1Py3
	b9K6HF+PlPMjKeHxZVkhZ2G8QcCLyOjfRTqPjo83zLYPzOZadbwTvYRvGLl4KyWMJYQF
	WfUwnARWhM7S60VhC1Yns2GaO8SWXo6unVomc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=sRyJnfpws7RiFAcyChdFYti8O1JpjkxibExC/2R8euIc9Mv57LP2GsgquXklG1hoxX
	mCc8VPhL00qP5MMrv38wg/kEz4tsAP/9xYEg+6IOsB2wY3o8RpM0z4/f7kJTRoFLH9m9
	wymkKQv/V3GQtYZFDHG0jumW9CaJXTUoBqxR4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.205.11 with SMTP id c11mr2384101ang.72.1245343940916; Thu, 
	18 Jun 2009 09:52:20 -0700 (PDT)
In-Reply-To: <h1dr55$nue$1@ger.gmane.org>
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>
	<h19s8q$jd7$1@ger.gmane.org>
	<4593EC5C-D89E-4947-AA92-3AD423A196B5@mac.com>
	<h1dr55$nue$1@ger.gmane.org>
Date: Thu, 18 Jun 2009 13:52:20 -0300
X-Google-Sender-Auth: 52d957bac1ed6988
Message-ID: <be7a9f3d0906180952v1bbb0611kd7079d5d947f83b8@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Patch for libfann-2.0.0 recipe
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
X-List-Received-Date: Thu, 18 Jun 2009 17:02:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Koen,

On Thu, Jun 18, 2009 at 1:48 PM, Koen Kooi<k.kooi@student.utwente.nl> wrote:
>> PR = "r01"
>
> Don't set PR to that.

I believe that most people prefer to always have PR field included;
obviously it ought to be PR = "r1" or PR = "r0" but it is harder to
forget to update it when it shows in the recipe.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


