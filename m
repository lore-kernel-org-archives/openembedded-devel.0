Received: from mail-oa0-f50.google.com ([209.85.219.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lloydchang@gmail.com>) id 1U4Ltk-0002Tq-1N
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Feb 2013 02:40:17 +0100
Received: by mail-oa0-f50.google.com with SMTP id l20so5152318oag.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2013 17:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=6PQX8CpoJY9YRlr4MM3+3TTt5wExo//Uzx2pmQmAo6I=;
	b=wyJGcFsvenaxObHbAm+gZqafRLrBjKLzDZap13RUPOTf2Wccofs/fe8KxHNkt1h90v
	CczTEsqSxGrImq57ZfEAlNDoXBSMplG3eMCEuJm7RSYC6tlpYeLOajYuPz/30UModUdY
	l/p99dB4PaMawR1A+BgNRwxAxOhYg7YxwWwPzrtaRRq/qOc3/mVyNkvC9EqVVo1kKv9h
	0cAO+Q2hMQjo9yQatSUVbLSuJ4R5c85uf4kUgBtsLg7fotIn6b3gWpaqAzZzjFGkSENY
	Z5N1oyTa8pmddkMZAxLAFgRtD1zYra6Jhznp9Ff3/8XNA32vCVLxirYTVQKQXehSdm9J
	47bw==
MIME-Version: 1.0
X-Received: by 10.182.123.78 with SMTP id ly14mr7648231obb.58.1360459447557;
	Sat, 09 Feb 2013 17:24:07 -0800 (PST)
Received: by 10.182.218.1 with HTTP; Sat, 9 Feb 2013 17:24:07 -0800 (PST)
Date: Sat, 9 Feb 2013 17:24:07 -0800
Message-ID: <CAKbR+sxz=QAFjbf5ftMt0=Xp7bDirgBZbJB4Ku3YhAti1OKLEw@mail.gmail.com>
From: Lloyd Chang <lloydchang@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	openwebos-general@mailman.openwebosproject.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: ca-certificates 20120623 and DEBIAN_MIRROR
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
X-List-Received-Date: Sun, 10 Feb 2013 01:40:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello, regarding ca-certificates_20120623.bb in OpenEmbedded,
ca-certificates_20120623.bbappend in Open webOS, and their uses of
DEBIAN_MIRROR:

In case anyone else run into issues fetching
ftp://ftp.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20120623.tar.gz,
please see my recommendations at
https://github.com/openwebos/meta-webos/commit/96726cd07c77038efda5dca04eb186379467d1ca#L1R6

I hope this information helps.

Thank you,
Lloyd

