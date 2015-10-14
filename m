Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 13B9273CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 09:08:52 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so48989288pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 02:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=7GKgbAGmERpzZAdNLcCYfWwAF4Ky/Di6R++jAbvCygQ=;
	b=QSxnVekwHzspjqsARW5YwwkIqtdF1WUc5wYucsjnys7lk+uxYcazHgRIeCcTHsH/4J
	bHmRMYY2VJu9L9EMZuywp5J2e7GK0Gr3MyZ3xqWQSpHd+hfYF2EKibLQ1EjSz2P6wVv5
	62dFLdKVF8EV6to7i7hIAp/7Viq2Aq/xZMM9YNc8oVqFEFieXBFrGOL0xpRd/FVd7Oiw
	5U8MVzZzK6cp8uShQOOP5KteMdWoFnF+iCvkDenm0Af3COqs+eOWa2ySApgDDgWPouOQ
	xNQtDCIbqKQtMVP1gpnmwlMcwJJ0Kk8Kg22JgN6BF4+aDOdV2vU/964d2NUZiCjdM9Ub
	Yn7A==
X-Received: by 10.68.94.99 with SMTP id db3mr2532836pbb.165.1444813732174;
	Wed, 14 Oct 2015 02:08:52 -0700 (PDT)
Received: from [10.154.14.143] ([192.165.183.201])
	by smtp.googlemail.com with ESMTPSA id
	x6sm8360933pbt.3.2015.10.14.02.08.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 02:08:50 -0700 (PDT)
Message-ID: <561E1B9D.1080406@gmail.com>
Date: Wed, 14 Oct 2015 02:08:45 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Saul Wold <sgw@linux.intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Dizzy 1.7.4??
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2015 09:08:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

The current dizzy version under test is 1.7.3. Will there be one more
update after 2.0 releases, a 1.7.4? I have not done a last call and I
have patches being stage for one more update. I have updated the 3.14
kernel but it introduced lttng issues. If 1.7.3 is the last update,
there is no point in trying to resolve the lttng issue.

regards,
Armin

