Received: from mail-ie0-f170.google.com ([209.85.223.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TsdIq-0006gl-NP
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2013 18:49:53 +0100
Received: by mail-ie0-f170.google.com with SMTP id k10so857704iea.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 09:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=TIjqfFLzzZev4LGNm1qNYZrASQ/R8j/PSEH3uyMCTUo=;
	b=npB4m8AyGQpfdTaPsoVHC1iLlGLW4uLBf3sXR6cIU3uhQ0XJrR12beA3hPSBLMpdHe
	Ur7vh9gni8nUJqboaglqkrEd6/DTW8eMKkZgvu/ru2oGPJrAvsZleDhXae5++4a+epzn
	IEqepHZka4C+/iNp9Z76DrlzCd9y4/cKKAuybKmS47dpdSn67HXoVRuhH94XWNk3a7Yq
	Ak8/RWKGEDKIUWxQQ/UfCU7zhWAa5QSM8NQGB+bL2HPzY8hlf4m1226G+0oD7swURqRt
	jZScnA8JiYTbAyfq+bpJz8LAhxc5Uvlyjg8X+VC38MIgDGVL5+//LjIaC2cXBMtxV0f3
	M40w==
X-Received: by 10.50.184.199 with SMTP id ew7mr9951250igc.84.1357666461512;
	Tue, 08 Jan 2013 09:34:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Tue, 8 Jan 2013 09:33:51 -0800 (PST)
In-Reply-To: <CAMKF1sosuv-y3vkcXC=pfhjEcixH1cfoHHuLGJ6vR_MwNXOmmQ@mail.gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-3-git-send-email-raj.khem@gmail.com>
	<20130107155808.GE6154@windriver.com>
	<CAMKF1sosuv-y3vkcXC=pfhjEcixH1cfoHHuLGJ6vR_MwNXOmmQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Jan 2013 09:33:51 -0800
Message-ID: <CAMKF1sp_Qi_G4kkYCJSVLnPC-jAx9Exi73k=uqU-kjdvmnD87g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH V2 03/25] autofs: Add recipes for 5.0.7
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
X-List-Received-Date: Tue, 08 Jan 2013 17:50:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 7, 2013 at 2:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Fair enough. I will remove it in V3 and push it to branch

I have now pushed a V3 into the pull branch where the commented do_install
is removed.


