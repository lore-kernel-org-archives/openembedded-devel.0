Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsxuF-0005Ur-WB
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 16:50:07 +0100
Received: from mail-vc0-f198.google.com ([209.85.220.198])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 07:34:18 -0800
Received: by mail-vc0-f198.google.com with SMTP id n11so3242092vch.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 07:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=I+LztXUiDG1GerkHyZSu3UXvl5+GO7znIpwDi3eGX/s=;
	b=maV1O7L9oEW+sYwSJ8hZiqDVL2MZHVDmPgliHXigtzv6fwrlmPlgS/FX+IgaNclbwP
	5uxRWhR6Mhx7ZDowNNd33UNwa4UulTVGjLCLEo0Xsx9h1m4G9W11t6efKuNPRrHJXlYL
	/uFfCGAj/6lbK7fyZ1rnKTQMYt2cUvlbz9kujyTmfh90m3P/j8I/CCKdH1Un2ybku6Jj
	fDuBsTYyJhFCSyW/De3EFoKJYDXZ6Yls0PLw/XQFl3O+YvQi7su4H1ZrKIm6YaYjO2NS
	up0AiLU1mz+/uhJQDFFIm4C3sZcHdYlrCWVxRjAWD9GbiB1uPBSnvfUkC17P7PKfFj4Y
	mblA==
X-Received: by 10.52.31.197 with SMTP id c5mr77719018vdi.65.1357745657359;
	Wed, 09 Jan 2013 07:34:17 -0800 (PST)
Received: by 10.52.31.197 with SMTP id c5mr77719016vdi.65.1357745657264; Wed,
	09 Jan 2013 07:34:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Wed, 9 Jan 2013 07:33:57 -0800 (PST)
In-Reply-To: <20130109142043.GM3722@jama.palm1.palmone.com>
References: <20121220132241.10D7310354@opal>
	<20121222200925.GD8988@jama.palm1.palmone.com>
	<CAJTo0LYQetj+657NjT+BHpg6jCOzUq63Ad2ghesThWvcLiSxcw@mail.gmail.com>
	<20121223093932.GF8988@jama.palm1.palmone.com>
	<20130109142043.GM3722@jama.palm1.palmone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Jan 2013 15:33:57 +0000
Message-ID: <CAJTo0LY92Zg7BrrCodQEG+=rHs+OZJPDnjotoLNqm7YNVxgoew@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQnr5cH6h3bof3TCFEtpdTGA+76CJ6SvXJd8K5Zi+HGdS22Ur9LgevjrTIKXi2As0HylHJRSFyoOiwYAe9jnxl84pJ+AcbgxfxHdNbNgTRSAG3FDHrLqCK7Na07DMMSQ163I0s9bnD7g3qUSQ1UjjxebsD81GM9wQ60m3oc11hrKY8NfJDlWEJgURSM7JbgDHSEqSCFJ
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] Ross Burton : python-mako: install standalone, not as an egg
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
X-List-Received-Date: Wed, 09 Jan 2013 15:50:09 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin,

On 9 January 2013 14:20, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Or how I'm sure I've never seen that. Maybe interaction with some ther
>> > patch. Need to use setup tool.bbclass anyway, will investigate.
>>
>> FWIW: python-mako builds without QA warnings after reverting this patch.
>
> ping :)

Fix sent.

Ross


