Return-Path: <eu@felipetonello.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0035C6E242
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 01:15:46 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hn9so4622247wib.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2013 17:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=ASLX2qvu377EXjFno2rYi+9ecE8YCNjAl0S2AXc9pRw=;
	b=SxK+kM8xLNVeuaUXTJPLrYY1nihmjiZdsMEseZkK+h2+SdT8IVG6f/Y7X+LBqwVYH1
	4lALkKSIajDtN+Uw4b7NJy9diqB2ljNjkjULnI2XJXJCF00IIyn0AMZ0vledFz/PcZev
	sGXS05EauRYYV5VcIzSfkpYMVo6EzGGEiVCNH0QSnjNQVrIHjWegjZFemkqP2NYEhahp
	biNLiuFfG2T5fZmZ5863ALgiZrrSV7QYK3ucKSK7J7gAztiK16W6/Vv6Y8KbOEuA8MQn
	kVbLk8a9ZvCBFg1+0TKVJlYXn/eyLhq6rgAiyt+QLE3hzHxfrC6A3+vDkFOXJd3h1LPs
	TFhQ==
X-Gm-Message-State: ALoCoQkiuhHhJtws0Kv8nMj8Me8c0YnYIljzqrC26L+0bkqJEY/E6MpLNs3a6MyUy6WNK4WaqZxg
MIME-Version: 1.0
X-Received: by 10.194.20.202 with SMTP id p10mr45204223wje.39.1386638145675;
	Mon, 09 Dec 2013 17:15:45 -0800 (PST)
Received: by 10.194.240.201 with HTTP; Mon, 9 Dec 2013 17:15:45 -0800 (PST)
In-Reply-To: <l777t2$pcq$1@ger.gmane.org>
References: <1385600219-18495-1-git-send-email-eu@felipetonello.com>
	<14902072.IG3b8o4YqW@helios> <l77732$ggi$1@ger.gmane.org>
	<1825979.KGUos5WM3r@helios> <l777t2$pcq$1@ger.gmane.org>
Date: Mon, 9 Dec 2013 17:15:45 -0800
Message-ID: <CAGrhNMxmYUKdgcH9kgSxqkF8nDqNrEpxZbqm9WewDem5zkAtSQ@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] packagekit: Updated to 0.8.13
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
X-List-Received-Date: Tue, 10 Dec 2013 01:15:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

I just found a typo in the patch, I will have to fix it.

Felipe

