Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1SAMxN-0001Lg-It
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 15:56:09 +0100
Received: by bkcjg15 with SMTP id jg15so1066458bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 07:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=WEjFFvXLKgByAFVUWntfQZpjh1a02wbF3IBUZO9Pwiw=;
	b=kVvV+3wbBxdvKAO5wTUQg1WlAzouAaSq1qAiAmTN4jXCkorDRSsCpSkUR74FI/OuV6
	Bn9lPA71furrmSP59nqeUOS8N/rMd2HDN0MDRa6nJhucFPuXKJoxWLS6wVAZbPCX7uu/
	zB8MrzdNjdr9SuC9PTc8SQVdd4NbRdEpDGTnOsBicH+EP0TK9PW5V5Gm6AW/lYbo13jz
	8DhWH74gy1CHqfbhfw3TooQF991iqyfRqiKbjXWZNJIgyzxmqFVLXTUQXK+WvupnJEB6
	5zwl5ERh2hDovfvz3r7utXu1fhGwfG9zbbDeJu/1U+3XJmIYKRevVIEK7HN7gOBQ0gci
	6kdA==
Received: by 10.204.10.91 with SMTP id o27mr1634356bko.17.1332341235688;
	Wed, 21 Mar 2012 07:47:15 -0700 (PDT)
Received: from mobil-400-586.intern.dresearch.de
	(pd95cbf07.dip0.t-ipconnect.de. [217.92.191.7])
	by mx.google.com with ESMTPS id m3sm3924567bkz.0.2012.03.21.07.47.15
	(version=SSLv3 cipher=OTHER); Wed, 21 Mar 2012 07:47:15 -0700 (PDT)
Message-ID: <4F69E9F2.40502@dresearch-fe.de>
Date: Wed, 21 Mar 2012 15:47:14 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <4F69AF4A.8050809@dresearch-fe.de>
	<1332326252-7381-1-git-send-email-sledz@dresearch-fe.de>
	<CA+M6bXnXmFf0syVz-71Y_Ovkq1pvsw8DBjZcfx1=dvZ4pD48wg@mail.gmail.com>
In-Reply-To: <CA+M6bXnXmFf0syVz-71Y_Ovkq1pvsw8DBjZcfx1=dvZ4pD48wg@mail.gmail.com>
X-Enigmail-Version: 1.4
X-Gm-Message-State: ALoCoQmmYmKl74Fl19wbA1XvR6XCZNNqRbWWdFF4y3Ip/r5pW/7ZRssdb/oqv0CleFPnmIXPXtEH
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmatthew-0.7.1: SRC_URI updated
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
X-List-Received-Date: Wed, 21 Mar 2012 14:56:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2012 15:44, Tom Rini wrote:
> On Wed, Mar 21, 2012 at 3:37 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> libmatthew-java-0.7.1.tar.gz is no longer available at the original
>> location.
>>
>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> 
> NAK, please switch it to the snapshot.debian.org URL I provided so we
> don't have to change this recipe at some point in the future again.

As i mentioned in another subthread the URL you provided points to tarball which differs from the one referenced in the recipe. :(

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


