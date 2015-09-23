Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3DB756C5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 19:12:47 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so125648623igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 12:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=VYrVkUUgcdfENs9BVU2gqeF9rUKSUvH237XTvT6Vtno=;
	b=WhVD8GC3+ScL1BJU4rU+6BRQGFykJr4c1zBTFG9/Q/EGd0VnY+Rx8VeqMc2lI9yR3N
	2BtFAdm9FkSYMo9uVKzHbtnO9QzVwPjkUR4b8OGSK6mzOCSXfZRPdqbP6N1J0/yfFra7
	6ORpqlp+GDsP+RVNK8zsUKVo3Qub1jKakgqXMfKYK1WXD3GvA9J067cTHJLbfyQ0UNrx
	eBClS2L0RXOYF5zteM8xjC1A7tGAwc8iZui/fyvAJOHVym9u18IJWzCzMeFc1qixzi9u
	O4qt7078bZLjum6LZWTJCZNykksUhYUvYh2GSry9Pl7F97Zm0fmQFcdkHW2NZ1clm6an
	VzGg==
X-Gm-Message-State: ALoCoQkDnUDBEfk6hnl08wTW554q6pT9MLdnIsZv8RVVrnC7Ewml0m8ol7Re8P2S6g5gJzPDWw+L
X-Received: by 10.50.142.69 with SMTP id ru5mr24112794igb.1.1443035567305;
	Wed, 23 Sep 2015 12:12:47 -0700 (PDT)
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com.
	[209.85.213.181]) by smtp.gmail.com with ESMTPSA id
	s14sm4083451ioe.12.2015.09.23.12.12.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 12:12:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbni9 with SMTP id ni9so34230938igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 12:12:45 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.93.42 with SMTP id cr10mr24135263igb.19.1443035565558;
	Wed, 23 Sep 2015 12:12:45 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 23 Sep 2015 12:12:45 -0700 (PDT)
In-Reply-To: <1442827518-10891-1-git-send-email-adrian.freihofer@gmail.com>
References: <1442827518-10891-1-git-send-email-adrian.freihofer@gmail.com>
Date: Wed, 23 Sep 2015 16:12:45 -0300
Message-ID: <CAP9ODKoKg_ZAbbh+MZLO5GKesD_9MWQ+7NABVJVeDF6G8PRfOw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: Re: [PATCH] pyroute2: update to 0.3.14, fix depends, fix license
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
X-List-Received-Date: Wed, 23 Sep 2015 19:12:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 21, 2015 at 6:25 AM, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

