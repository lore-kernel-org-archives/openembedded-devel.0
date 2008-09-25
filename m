Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Kinin-0005uW-GY
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Sep 2008 12:05:17 +0200
Received: by fk-out-0910.google.com with SMTP id 19so361664fkr.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 03:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=3bDs2IlGoBIjTVod2fPlmjTwSiDiZl4o1uurVZtIXeE=;
	b=aQgNF/Fqfu09cnNLQRUqaGzXlyc6VL6bwZfbiR99vbzeGXX3sSZ7v+16y4dUKFulVx
	7ZTIytQO5IeksTowdvP3CCM/8tKY5dmxkedvYcPXng+b3hE/JhshuOZiGzDe9abVKbfK
	srifMAKeWQCsITgqcGI279HmhvSsH9YJqXdsI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=TeK8M+W5C8T4NaoSZw/89BgbOZcevOCYAew5jipaT8iBr/S6JCOwwQtgFcg658viyO
	5L5CJc5bwa8Q1rSaDZdbATH516nCvqzz6pdlGI7ncaNr0ZsUU+tcP/RooxBivokRWN87
	Z6W9U0cMOaugrKR8kpHywHMWfVqs0TkPRkdMs=
Received: by 10.187.205.16 with SMTP id h16mr2194591faq.66.1222336896635;
	Thu, 25 Sep 2008 03:01:36 -0700 (PDT)
Received: by 10.187.224.10 with HTTP; Thu, 25 Sep 2008 03:01:36 -0700 (PDT)
Message-ID: <d1b08f940809250301ve2233e7qecf9d555b486caf1@mail.gmail.com>
Date: Thu, 25 Sep 2008 12:01:36 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080925040653.GB4510@denix.org>
MIME-Version: 1.0
References: <20080923211433.GA29169@denix.org> <gbbmll$t6i$1@ger.gmane.org>
	<d1b08f940809231433j6063c230wbd805140f40b69e@mail.gmail.com>
	<19c1b8a90809231706t75098d92pcd49608d6eee9b1e@mail.gmail.com>
	<20080925040653.GB4510@denix.org>
Subject: Re: libxml2_native_python_dir
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
X-List-Received-Date: Thu, 25 Sep 2008 10:05:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>> seems good. Bump up the PR numbers when you commit.
>When can we expect the fix to be commited? Thanks in advance.

Khem, please do (I never applied for commit rights).
IMHO no runtime changes so no need for PR bump.

Thx

Andrea


