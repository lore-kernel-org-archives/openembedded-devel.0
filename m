Return-Path: <thomas.besemer@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 50BA06FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 20:42:31 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id m124so12167007oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 12:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=25Pkj807v9+kSFvoWQ29u7gE9YjgnnSBFE53B5f/MHw=;
	b=LSACShCEFMd/Vn5gggD7u55wFcYfYqf2NTPYK0tQ90JrKXpqRch2t4cWRZiNydq9eb
	RqXFvsBEE6yOSelkb8pif5TqUs0ZY1f7bxWCrVx8WrWNxRH4lDpMJ/kmGJ0Mrb3JXo9t
	m+X1t4H5+HUYjd6MDCBToOzGe3u3BMFbwn7by7bkWTxbz2cBLrG6ue7if3pelccYNa0A
	YmtGMEP6HmOXYG37aEpPCSMbMa3wico4oi0u9a5dAIXWP59dZGTBkhC8CXEawY8i/BCc
	qzVuEuiPRmJgIlyG/I06IzBhzFowan0Y68utwYjAoO4ET8+c8bzq9u9FhHs7Myqvdoo5
	JOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=25Pkj807v9+kSFvoWQ29u7gE9YjgnnSBFE53B5f/MHw=;
	b=hX3DfsFgZLmY5Ir1jhf3zJvkN1paBUrpFc0ruHm9OWB3RnwRVtrUCfhfIsMr0ByTuB
	DAoCZ/ozmDKDsyTJpJiUQMSaC+3U/a66OZ5CHmYpzfLlFBD6HytHle+HWtFQUTk9VnYa
	Qwndu0wWSEdYDYbHH9NOLMa+P87WM7YmUv2JiDVJ7ilAdhtynCAa045wlp0T/pMdWuVw
	VXErEifcb6fABMeelvLC79RVD0rfQj20npzUtPS+C8j9QpSeexQsQE1qaDmKMRxxYiJn
	PdTpDPbWyNEp5wI1rViuT2a5LurdnEpm3g0mEISMh2kAZGIaKEXTkM4nZFuwBnb1yT86
	73vw==
X-Gm-Message-State: AMke39kYtHbAyTxvQvAQMlOVDhOkO3JR7wuT2+6+a5eidhCe10KFRvTf5GxO8bjiZSCL9PLpCdIgirYA+KIJGw==
X-Received: by 10.202.218.9 with SMTP id r9mr2207963oig.119.1488314553098;
	Tue, 28 Feb 2017 12:42:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.252 with HTTP; Tue, 28 Feb 2017 12:42:32 -0800 (PST)
From: Thomas Besemer <thomas.besemer@gmail.com>
Date: Tue, 28 Feb 2017 12:42:32 -0800
Message-ID: <CAO7m3AknvqH4=3OgwsLOK2n+tkvzdwKL_RKgb0pJHxq545YLNw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: <libuvc> Meta Layer
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
X-List-Received-Date: Tue, 28 Feb 2017 20:42:32 -0000
Content-Type: text/plain; charset=UTF-8

Does anybody know if there is a Meta Layer for <libuvc>?  I've been poking
around, can't seem to find one.  What I have found is this:

  https://github.com/ktossell/libuvc

I'm working with Morty release for Yocto/OE/Wandboard, using SDK for
toolchain.  When I try to compile above, I am getting errors around
<jpeg-native>, but have not spent much time trying to resolve.

Suggestions?

Thanks,

tom

