Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SUHYM-0004Tm-BV
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 15:12:38 +0200
Received: by yenl13 with SMTP id l13so4756284yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=opgH5f0vwbZ5noW5eb/JBSWVLEjapuhceNlMJnqaga8=;
	b=JE7nSYYGqqsSeufExwB01lma1gCSyPLHHD10LftBj3M/9apY/bC/7xbwbIEMbiwnmA
	rp5fw77iULOoMyxeiCxp/h7FY4b/QHL5O9IpjR8EyqkHxMsZPqtwmzt9+BESbsz/boCh
	i5VPYQYqeIfYDxGJAc+UfSvrtXLnxTopH6GnNgR5VP1SeWYjOKyKU8u4bsuFlCr/0Ty9
	hB9nKiScptDBPLtfLUH869ejmoz4xn1UNFSPCKfghKRrvFHhbJKAk+VyPIH+obvhtRjM
	96Etq59SsWuAV0J7O3dODj+qrmrClSlB70ECckCaVTCx614zqXrEiuxWa1k6yU/NkwMZ
	dGdA==
MIME-Version: 1.0
Received: by 10.50.208.34 with SMTP id mb2mr3895965igc.5.1337086957710; Tue,
	15 May 2012 06:02:37 -0700 (PDT)
Received: by 10.231.241.3 with HTTP; Tue, 15 May 2012 06:02:37 -0700 (PDT)
Date: Tue, 15 May 2012 15:02:37 +0200
Message-ID: <CAOHjBZto_R5S777po-K8mXG-Z9XLYNVzE05-kq_TOCeo4YgyoQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [oe-core] Packages broken URL
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
X-List-Received-Date: Tue, 15 May 2012 13:12:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

there are a number of packages having a broken SRC_URI, for example git.
Has someone met this issue?
For sure we can correct those links adding a dedicated .bbappend file for
each failing package but
I think we could also update the main package fixing the errors.

What's your idea?
Thanks,
Giuseppe

