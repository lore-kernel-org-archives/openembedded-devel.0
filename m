Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nishantsoin12@gmail.com>) id 1Kmj6W-000536-Ay
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Oct 2008 07:58:00 +0200
Received: by fg-out-1718.google.com with SMTP id l26so1872676fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Oct 2008 22:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=hIbQSVoW/GtRT7amHHctBat01geutdzMZo4xLlntARI=;
	b=eQCUt8lKkpcEGJjR1SHcWPR5Qkkju8+wX+P6Wsno7Sd+/t+c8fI6aMafYFQIlY+AhM
	poh4GQLf7Qvt2WA7rGxAJvIcUQLKydmUjNp+eguCo3frtc8y7XbpoGjN5bP684qznAIX
	SqF7zb0qkcoCJV57suJ1/ChE0BTgToP/2SEs0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=dJiX1Jsam2qHcy+HMoinAD3yJsE+1Bg38HRTkZDtB9rN4PxXA1k4QgOmE3YgvtYUxz
	Onrrk68ag4h9Qv+Y0TD28SVVA2piQ9he91aooJ/fNiJdQtAdSgKZopoXgDP1h2huP3FG
	ZrCmDTWDWzXaJwANZf2ceVKBGrI3vLOcAV4KI=
Received: by 10.187.196.3 with SMTP id y3mr916665fap.74.1223272412448;
	Sun, 05 Oct 2008 22:53:32 -0700 (PDT)
Received: by 10.187.225.9 with HTTP; Sun, 5 Oct 2008 22:53:32 -0700 (PDT)
Message-ID: <73a60a6a0810052253l5c281e45q82f7cb4a0a021390@mail.gmail.com>
Date: Mon, 6 Oct 2008 11:23:32 +0530
From: "nishant soin" <nishantsoin12@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <bug-4653-13@http.bugs.openembedded.net/>
MIME-Version: 1.0
References: <bug-4653-13@http.bugs.openembedded.net/>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [Bug 4653] New: evince-2.23.4-autobuild
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
X-List-Received-Date: Mon, 06 Oct 2008 05:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi
        i want to create package for gcc-4.2.0 version. While compiling gcc
i get the error that sys/types.h not found so it is not able to create
libiberty.a file.
        Help me resolve this error.



-- 
Nishant Soin
Embedded Engineer
SQL Star International Ltd.

