Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 055EB607A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Aug 2016 12:33:05 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id u186so15978067ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2016 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=LIOV14bGrtRZ0zZp1rUvz+0qkGRa0uUqKfEAqvrB6Mc=;
	b=k4cHvuyKH30OvL4217YvPX4fkH9TfkfRhOPFEBAlLJOba5+CQ4Q9y99WbH6Z0cBNz+
	R6FT3mf7+TdbTl6kpLfXRyyVh9gQ3W5fup7zuXXn6xJWuviUoVGB8IJrEljFdBbQUzkF
	McU+aFAsOAJcaIrCxeOZaHft+Ir6yt22pLaXAe7eRjVXpipB9vvhY+VJTtKJvsYGUwmi
	7RdOJtgtQqElvpNJnGuOLoBX5LvJJjr5Ry1+mcYb+1njw1UlwLhwD8rEApw6t+5zAIir
	HsNaNgyk4Z+dr8rl8Q54CBUBPVcUZuEIOtwwu3CLTZGwlvzMR5au/fnrOwKaSzuY1SkC
	8DSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=LIOV14bGrtRZ0zZp1rUvz+0qkGRa0uUqKfEAqvrB6Mc=;
	b=WbHjDFGx13EUDHxVRG0hv/rzL/0xYMQ9gtnEhPvsqNce+2G4ReZc1KZaX44zuR86ng
	uWgWlsCOVFz+G3o304GFxxHnjAHsyo9sQ8pbIhtH11yqW7v2S2vG3tX97sXARFBsXP+f
	FyOK45hTUxk63zabVUNS31fFZt9qQzHeRhC39KE4778hMZcjRq+lVQXKmL9Qpql5Fyxk
	lSM2YR1KjECsTLaZ2EBCwpQ8iOdpGHKcX7D8WmmLT8XFj5ckYnY+S48Eq/r4WvqlxGuP
	jY/ApdZ+qEzgDn8EJ4L4RwoszuWd3yYRP1GdzHJ70VMQNJYEWbPP2WIDRR79arKlRvFZ
	4mTw==
X-Gm-Message-State: AEkoouvFvSky/kbt3FcCBAzNO87xEbQE6jukhQiVx+rHeKO2WJw5j2oVPkhsa8lofYXNHg==
X-Received: by 10.36.124.67 with SMTP id a64mr23873407itd.21.1470227586202;
	Wed, 03 Aug 2016 05:33:06 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	o15sm16544398ith.2.2016.08.03.05.33.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Aug 2016 05:33:05 -0700 (PDT)
Date: Wed, 3 Aug 2016 08:33:03 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org, eric@eukrea.com,
	denis@eukrea.com, otavio@ossystems.com.br
Message-ID: <20160803123303.GA22401@openSUSE-i7.site>
References: <20160721042134.14806-1-twoerner@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160721042134.14806-1-twoerner@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-browser][PATCH v2 0/4] chromium updates
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
X-List-Received-Date: Wed, 03 Aug 2016 12:33:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

ping :-)

Is it possible to get an update on whether this patch is being considered or
not?

There's also an earlier patch from July 15th which hasn't been added yet
either.

