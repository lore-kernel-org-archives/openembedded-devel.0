Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TukUD-0006xq-Ap
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 14:54:02 +0100
Received: from mail-vc0-f198.google.com ([209.85.220.198])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 14 Jan 2013 05:37:36 -0800
Received: by mail-vc0-f198.google.com with SMTP id n11so7417964vch.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2013 05:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=FwxH0rOQYpxBwhMHZh0bk7gKVqBVySXzCTZoeF4FIm4=;
	b=SMlJnF+eA+yAhkHN2yOl+8ABKfqri6++yIS9iDtrbxsuFynCBCyW8GxOz9XBnjCKkO
	JtNOarczFeM8e+hR1qv27DzKAMgJ4sLp79uiI79b9zxt/Mz4b7yWZJFcFqfs2YxBtvAE
	m23SFIWtyIp/Yi8BvDfI4kkAz0mJFMTCeox3QxXZ/SPK3UNEj/bBmIJb7bF5RWNqpHid
	w45qlXZbDxWRGkZ+IPEQE+A3fJhTAAc5Q3wjMeYwgfJrQhM3hqetNleqzczzv2exhied
	01/LRnN3Vt0pk8dFDTSlj1FDM/IHT+FkssnagWwmRnUbCb5a0bGFO4tjwYVa2BgZyQlZ
	v43Q==
X-Received: by 10.220.155.143 with SMTP id s15mr13245996vcw.35.1358170720444; 
	Mon, 14 Jan 2013 05:38:40 -0800 (PST)
Received: by 10.220.155.143 with SMTP id s15mr13245987vcw.35.1358170720366;
	Mon, 14 Jan 2013 05:38:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Mon, 14 Jan 2013 05:38:20 -0800 (PST)
In-Reply-To: <2159085.vty0yDIBH9@helios>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
	<2159085.vty0yDIBH9@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jan 2013 13:38:20 +0000
Message-ID: <CAJTo0LZVhAeEKW8vUA4=r1poz80p+w9jTOCDOJHK8tfn52PyXw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQm5GVrugmjwaTrTLnniBz5yHX6dsBVvPw0LDvQ6X07QlUTTfXp64OMz9TSEI8sZhtuxnGgWvdZ2/vKCLrBApF02MZkRnByaw4DZs7a+Lnsz3Od7Ma5APOuLWz58l8oyEjpUH3ZVuGh5MOoZ+CXFmpI52tQv2HayD5DjJj35Lrpo6KyJe0OkD30OnHT/6bfMerhYH2Dn
Subject: Re: [meta-oe/meta-multimedia 0/2] games preparations
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
X-List-Received-Date: Mon, 14 Jan 2013 13:54:02 -0000
Content-Type: text/plain; charset=UTF-8

On 14 January 2013 13:34, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> There is a meta-games FYI, I think this is possibly where these recipes ought
> to have gone.

Agreed, these are gaming-specific and not generically "multimedia".

Ross


