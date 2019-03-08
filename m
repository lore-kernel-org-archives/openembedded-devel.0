Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 984A0747E7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 12:26:00 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id f2so16235786edy.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2019 04:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9XS1ogKAQJI8E+byq/lG4lU+pzei2iBc+PxnhcJYIbk=;
	b=TDv/u0Iy3FKCkfu/h6HhjZHX/gdhm/bYzTakFS2znK+a8/4t83bu2LtJOBacI8fWo3
	pX8lTEF+c0NP0PcQqeGUAZnUqcYK0yoIORuxD1edDzfam1cDqtjqHLXdhaamcng/lezl
	jr6+UjXYn7R3zEDiZ8swkwB9C9NgFztQXA34s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9XS1ogKAQJI8E+byq/lG4lU+pzei2iBc+PxnhcJYIbk=;
	b=fTVTEdPVXl52/gHUqVpKvB+HJsXmxxuYEmRZKNVZuVyL1xtWhPWIW6HMG2eHGec9TR
	O9XKP/KvJKd0M/mdzQSFyI4ACP0bSJe+xqxOjsuWNwCwC5CG27u9GWtKi7DcW17sIl5A
	0DfIcb/lrAqXvLMvtTFp4ook46X7wZKa3/b6sKZ0aQQ7kL7p8tzUc942Efvgp18YZfKE
	7Qsgp090L9TWELq+Dpy7CSlQoCL0U/jX6x1jYSRV9yj5nMmP9M+3A00522b48vjjjNC/
	+9bRWzBQ+5buqyBdLkRX7w6sWiOFHNCrzrdM7ay+GP1IwGPLa4qDirJcAtOhSmOb+5BD
	KIuA==
X-Gm-Message-State: APjAAAUL/H6GZkR0b9Bc+KTOeaWPJGNyo1+OuObQRVd0o8PZzJogOLky
	qNaG0H7l+lB/4jc2eO3OQBiHDcWKzTeqpg==
X-Google-Smtp-Source: APXvYqzOEAa/1e4H3OPhYjPpyfZKQJdvMN9kq6BmMNWw61pnpt0ijr5deE/OpLZpDcXBqn2c0c1sTQ==
X-Received: by 2002:a17:906:4cc9:: with SMTP id
	q9mr11648075ejt.54.1552047961106; 
	Fri, 08 Mar 2019 04:26:01 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-606A-AF5B-88B1-B23A.dyn6.twc.com.
	[2606:a000:1401:880d:606a:af5b:88b1:b23a])
	by smtp.gmail.com with ESMTPSA id
	l53sm2154989eda.66.2019.03.08.04.25.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 04:26:00 -0800 (PST)
Date: Fri, 8 Mar 2019 07:25:56 -0500
From: Tom Rini <trini@konsulko.com>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190308122556.GC5026@bill-the-cat>
References: <20190308090657.4180-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20190308090657.4180-1-bunk@stusta.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] Also remove meta-oe/licenses/vim
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
X-List-Received-Date: Fri, 08 Mar 2019 12:26:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 08, 2019 at 11:06:57AM +0200, Adrian Bunk wrote:

> vim moved to OE-core.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

