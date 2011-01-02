Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PZVKe-0008Fa-2s
	for Openembedded-devel@lists.openembedded.org;
	Sun, 02 Jan 2011 22:19:16 +0100
Received: by ywi6 with SMTP id 6so5420363ywi.6
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 02 Jan 2011 13:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=e9Xv+2wc6LLLlMxRxDpgjcV247hY9WyT/HIt6oM/hfs=;
	b=nha6aPXFwsyQSsMcxZUwKTd/zJpiRV3exfQVhJ2qfaI1MX6j06i3cwR1kvZ6jUZniO
	sadrjedi/OhH2fX2HVyG/vboc1qTwRn750Mg2TFZIBZwPIQJcU0h9YtzG2dqTADgdyc0
	b6BTHfPF9efvlQPFCwqGNqnrdwidg0WELkrUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=sZsq0zMZuSSZNQLOxX6CSN3/zezFHqArtGqr9c/pca0aIEUJDQ/HxTSxLcxraBDlCW
	r6xtY705VHav+ISbZm23ay1O9tNibVUrG0qItOrxUZdW8exQ1TPLBs2ZNWTrPxmYJU8T
	nWMn9Yag81OmBX5fCe/mXD1k6nSxRWNZcdN/E=
Received: by 10.90.98.11 with SMTP id v11mr11580752agb.58.1294003130480; Sun,
	02 Jan 2011 13:18:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Sun, 2 Jan 2011 13:18:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Jan 2011 13:18:30 -0800
Message-ID: <AANLkTikZ+em=pxLmGQ+z27Xb43wJxK7GZAWPMB39L8w-@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: gcc-cross 4.5 regressions results on cortex-a8
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
X-List-Received-Date: Sun, 02 Jan 2011 21:19:16 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I have put the gcc 4.5 results here http://uclibc.org/~kraj/gcc-results/
these are currently only for armv7a

Ideally the recent results should be better than former reports.

Thanks
-Khem


