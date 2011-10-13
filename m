Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1RENCK-0002Wa-RH
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 17:27:53 +0200
Received: by gyc15 with SMTP id 15so130166gyc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=aazDSxbfIOKrJgQrLGTL8tqACqzJDsR7EQjW6Iktr54=;
	b=MftWin/NsQna0GOEpzOGmKHTSAT9b/DUBd96VoY/R/v8asLldsVIvjdt8ENYaZR7pE
	PemjOJFlK2D2nl1zYp0OvtAIH3Kl0Mt8rScv8gvkpqhiBfSUmgwchjueEl+997pT6vAt
	mT9XMFJ5F/EmJSqsF8gwXkfMLi62XSp2GiqQA=
MIME-Version: 1.0
Received: by 10.150.48.40 with SMTP id v40mr4944221ybv.98.1318519325579; Thu,
	13 Oct 2011 08:22:05 -0700 (PDT)
Received: by 10.151.112.10 with HTTP; Thu, 13 Oct 2011 08:22:05 -0700 (PDT)
Date: Thu, 13 Oct 2011 11:22:05 -0400
Message-ID: <CAFu+nvHi=pWi-bX5NrTQAk_JVv04YTa=d60Rg7YVSvLv7FNsPg@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [2011.03-maintenance] using sdk as external toolchain
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
X-List-Received-Date: Thu, 13 Oct 2011 15:27:53 -0000
Content-Type: text/plain; charset=UTF-8

I've built an sdk with oe on the 2011.03-maintenance branch, and I am now
trying to set up a local.conf to use the sdk as an external toolchain and I
get problems building gtk+-native.  any ideas on where I should start
debugging this?

