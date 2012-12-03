Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TfaV8-0003YD-Vd
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 19:12:19 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 03 Dec 2012 09:57:10 -0800
Received: by mail-ob0-f197.google.com with SMTP id v19so13049078obq.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 09:57:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=9nYvNKdRj8kwjdsW5oTzRIlqTcN95YyA7PfAHneBrVE=;
	b=ENrK99y474cWg+aOgNknguhPnvLyT2fwcKnVGflL9nSz7qGQofEgD7xieHsC4JDlAe
	6cvanzyB+9EBYniigBLhpI5Irvg7DryUW1jOb/wTud8I/cG03SRjpXsvQkJBjokROgKn
	UeJKHhTpgAKHwtVskxWbAfMrPAxrnUzIGAQQRj7y1uCNGY4/y3OvxqvrUcTrHrTGDz1R
	qlnISXIxStMRXHgqrWCaSBX7HCBalHtaB57pBkoFr2Y6c8wjind6vaUHR4CujPi/Qhjy
	me+Y9dVHe0WbzSZvUVhG1Tx/B9B6CWUDUfnWLaC9LJAryONux0JxzuFU5ygngKSQwKLY
	ALRA==
Received: by 10.60.31.49 with SMTP id x17mr9154582oeh.33.1354557474659;
	Mon, 03 Dec 2012 09:57:54 -0800 (PST)
Received: by 10.60.31.49 with SMTP id x17mr9154574oeh.33.1354557474585; Mon,
	03 Dec 2012 09:57:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Mon, 3 Dec 2012 09:57:34 -0800 (PST)
In-Reply-To: <1354554250-12014-1-git-send-email-mario@ossystems.com.br>
References: <1354554250-12014-1-git-send-email-mario@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Dec 2012 17:57:34 +0000
Message-ID: <CAJTo0LY2xvYBZYVzeze3ZkGSra=AJaDO9L2koB3oxOn0CbN9Gg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkn2BofHOPoMZ/wEdj0Q6dWc5/Flhd1FyhiuSCqxXWkHPqY1dAJyRMakNbF42xJ8Gj+9XvzvBhhY+W8bAE9/216tFMuM9GCTY+NKKmIYkZDZIAABQCkHGmpAqInWybctqtrERG5ysQr5gJMPgX5UMz1anR8FWhaftweRcwhL0bX8zeXK8HlHEsu5EnnBENt2a7vPH31
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [PATCH] pulseaudio: explicitly set --with-database=simple
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
X-List-Received-Date: Mon, 03 Dec 2012 18:12:19 -0000
Content-Type: text/plain; charset=UTF-8

This should be sent to oe-core, not oe-devel.

Ross


