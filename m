Received: from [209.85.218.213] (helo=mail-bw0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LZ99l-0001T2-Qf
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 20:29:30 +0100
Received: by bwz9 with SMTP id 9so3104169bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 11:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HZrv35aIQMhb/lb8oKKmoW24RCBlsrOzFWQTuhzpNFk=;
	b=wnRq355fvsdt8AG/Tw3SPlr6t7sh9Sd5Z9hZlBw1KQFVKiCmXx5qGv7eZkpO2MMlxl
	RVA4pGulvTXSidrgairIzoFVKCF9KwDpo64XGUrBFGixc1qeM7/KqcAkCw20UyD/Zg5d
	/RUJW5YN/BQ+46IQnqm6CsI6eftkqhFbXe4QY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=a+bAuptutl9agpyXmv71Pt4oP4Nr5Z9DxZn3KVRtAV6f5BTiktPy4UP61g/xSfxZ45
	Z/oQRl8h40eyBlIMsXSg9LwIfSm6KqEq6yRMBn8TspczZFDurFCztyPRfnQXm7PPg8xa
	+aaadJv4QtydCyps95dulb5wzGWKzf+P6M2Xo=
MIME-Version: 1.0
Received: by 10.180.218.15 with SMTP id q15mr2052797bkg.194.1234812453999; 
	Mon, 16 Feb 2009 11:27:33 -0800 (PST)
In-Reply-To: <200902151921.39445.openembedded@haerwu.biz>
References: <20090215023549.92DE8E802F@amethyst.openembedded.net>
	<200902151921.39445.openembedded@haerwu.biz>
Date: Mon, 16 Feb 2009 20:27:33 +0100
Message-ID: <c384c5ea0902161127y3a2d7312j5cd9c6ceae304677@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Lynn Lin : Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 16 Feb 2009 19:29:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Sun, Feb 15, 2009 at 7:21 PM, Marcin Juszkiewicz
<openembedded@haerwu.biz> wrote:
> On Sunday 15 of February 2009 03:35:49 GIT User account wrote:
>> Author: Lynn Lin <lynn.lin@avocent.com>
>> Date:   Sat Feb 14 18:35:07 2009 -0800
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> mini-httpd: New recipe.
>
> WTF? Please conform to CommitPolicy (first line is summary of commit).
>
Please watch your language. I know the choice of abbreviation isn't
meant to be rude, but that doesn't rectify it.

This might be Khem re-using his existing work flow and tools for
handling patches.

Khem, could you pls adapt your workflow a bit; we like our commit msg
in a certain manner; see wiki CommitPolicy.\

Thanks,
-- 
Leon


