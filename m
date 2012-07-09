Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SoA9b-0004DG-P3
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2012 11:21:15 +0200
Received: by ghbz2 with SMTP id z2so9168626ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2012 02:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=rNYYwLbiWdJMt+GlbNIiskd/Yk8CxkuCPZszfeMdmUQ=;
	b=dl1HG83vuAY89vlm9A3ihlFEx8Tsd/wH8p7CaCNeBjpO8k514mbtFPxuk6sX3aVAiB
	sb5SirQjFAH1eg1dD5frqsnZdB53ESJETsg52B02DS1eW/oaA/Ugi+QGL8FjbmA67/n7
	vKJ1vRGZOOFUY9VOwGVcQcew9bbK+zpjNui0j1YFjgLaNBTdGBy2jWBlFOtcDOo3RRif
	X4PupjaEeDpNh2GiZBRkWCHnm4+tXNzQOkzZCFowpYRnqYPnkcIfXXYctfKWgihIKoq9
	m+p3u6s/8rhMX11owoNBM+6QUz5zlZ/CEuxCcDS9Es8VRApN4qMYIb01GOcSSJEWNeOt
	KEdg==
Received: by 10.50.91.233 with SMTP id ch9mr7724663igb.8.1341825006100; Mon,
	09 Jul 2012 02:10:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Mon, 9 Jul 2012 02:09:45 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1341759929-32341-1-git-send-email-apelete@seketeli.net>
References: <1341759929-32341-1-git-send-email-apelete@seketeli.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 9 Jul 2012 12:09:45 +0300
Message-ID: <CAK18fxF6azr6-4B-=AQOYTe2hkXpQ52P4D12y0O2hx8y6z5=9g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkaAjqZXuWOrCMAF518krMm7YJr8C4CxKWhfSzsfGT1QK1dkT/UnltlBsNYLbBtnnJ9rUkj
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-classic][PATCH] libpng: update SRC_URI
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
X-List-Received-Date: Mon, 09 Jul 2012 09:21:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 8, 2012 at 6:05 PM, Apelete Seketeli <apelete@seketeli.net>wrote:

> Update the SRC_URI of libpng.inc to ftp.lfs-matrix.net since
> ftp.simplesystems.org seems to be down.
>
>
Now it's up and running. Could have been a temporary server problem or a
local one.

@g

