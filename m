Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD6577ECB;
	Tue, 19 Sep 2017 16:54:46 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id 47so230786qts.10;
	Tue, 19 Sep 2017 09:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KcGWnLEcjnM5vweGk2qshII00QGkUR8JTFmUB8GiqFM=;
	b=JRQNEbq/a9ZCcq/J+iFRfvYRziGo0y18UIl+ff2yh3DnIBz6YAJo7lzNzrDFZXyLns
	kubncFqms0zq+zmoSi1sLOk5oVPK4cAdoyLTWQH+JZ4FUlOEWAg+trhitoKMbOOwnUHn
	NLm8MH8F0uiRLnQQ6hpTigJUf0PghxAnZHBQkSW1un3bDXSszYOgMJ/5k20dd7XzxBi0
	sS7p6e0Yg36KfdRuqMMUI/B8KO0LcqcoDCdxJ5bXwqFFzrVwevBsJ1s4nY3cPcDGiYDf
	Nxim/GlGl4FHT4XddqbwnxYKRf+YtxHz41N3NKvq+V+CTiwuBbB7rEQR4EmLDMfq0svz
	JUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KcGWnLEcjnM5vweGk2qshII00QGkUR8JTFmUB8GiqFM=;
	b=VMtsdrjwFS332mz0KwtbLduhWYRmXHCA3oZDLNGGIFOnHOIyTJXcQAmUJioU9kKE4P
	8RCrRr+meGcaLcTp4SUv4AW++hrzNoKlwYvrcMmam1pZiuTEF0r++ZdFYrspEGLETZSF
	FlWHH7Z5Mf0NFSNxswdBGBBfydicJ5PrFOU/zfq1PP9JNkqJjbJ43tRauYS0dWb9PCys
	t40SB2tFfFkManhpmtKpmWsdRBxQHJxWBvq0CwIiKccK96GL7iHNB56Wp8TiDcWRI+SN
	KDY1jeirFRElOotJnN5h43euyW/eZqXhJ/SxA7ZbDfdbAbsPe25DNxzsAE6qbM74xEWq
	sqJg==
X-Gm-Message-State: AHPjjUjQFzWbD88zDmDblQomYN0u4DVr4PB2jHiF6UFMSLDI84yemgX7
	p/BVnZxqWA0Vs5cQdADdt0seVV/pPIpXt3TXNfQ=
X-Google-Smtp-Source: AOwi7QBcn9Xt0iO3p7rqsI/cCaykmmgrYYalih/wO1KCzHLgJyixE84HbT6CyuWLcP0tOtK9i0NK2P7sWy+fm3TR51U=
X-Received: by 10.200.3.4 with SMTP id q4mr2898845qtg.200.1505840087672; Tue,
	19 Sep 2017 09:54:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Tue, 19 Sep 2017 09:54:46 -0700 (PDT)
In-Reply-To: <c2ec1aa7-8279-78f1-6523-c345af1ffe8f@mentor.com>
References: <c2ec1aa7-8279-78f1-6523-c345af1ffe8f@mentor.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 19 Sep 2017 12:54:46 -0400
Message-ID: <CAHUNapQDGe3b4Nmg6OmL0hxkMGyY9e3z=GKdkOW8VuJe9-q2Ew@mail.gmail.com>
To: Sean Hudson <sean_hudson@mentor.com>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: OE general meeting before OEDEM next month.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Sep 2017 16:54:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 19, 2017 at 11:34 AM, Sean Hudson <sean_hudson@mentor.com> wrote:
>   Meeting information, including dial-in numbers, is on the wiki. [2]

In addition to the above, we could also make use of the little-used
#oe-meeting channel on freenode (?)

