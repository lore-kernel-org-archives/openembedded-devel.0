Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D157761785
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:50:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNrT35Lsz40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:50:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582318217;
	bh=TCPDNaLVQ1OD64KHSfrq3Awm7rbPFGMlhKODZRxhYzE=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=BfGlsRjxNxaC/1mQTtJOMXA0SUeN+SS+219Vfbe3mlJxr8eY4/oZOidagkMrwjRNt
	7k96wOSu4PDDzjjPhcbE1n+VVnv9VEMNuE1aq9n9Rx+r4JfZtY8qTCQWEDdftwyUOy
	46J7vsvSzSrfBmueIxdOOoDSfCAhWT/DiF/XvQMFweQlLDgjEX5nCX8JI1l+eo2Nqr
	exlB+d0+ywGbGqBH48zWdZcwynQ+CIvcF3RYn7jWqiOdh+CJrWhKuwaB+4jMn1U8+H
	Xc4Od6nRycdxIG0QtKNpzvmfYKfmbo0Uli3YB/y0gLGhisoBz473YLb1x3yXvhNiN0
	TiI5mBYtqD4kbx5LGOQzWAe017oXRTrhTaJ76AePzbAjEq0HP9jX2+wUgDW417ynsn
	bg+7/EB42ELl6NcosdfIAyZU+K+gyERjCTne1bHzqIi+cFKtpAX//PLW576nY8Qas/
	HSztCVv4o7ksenxdLqNrJU8PtoHQHiGijn18dDm4uxyt0gDP+s0UCjSk7HMq9bvV4n
	xBrNtbtE+g3nMj9r7hiwP+aHhZh4QuDEiXgonGwuHsQA2jYQ7G2BQb3gLsWksALYp6
	nsPpacztOjOyKFsCeEzxQfs09QFGNIqMI82btO/9qSzBYcouZOdZeez4wB3RmLfcGU
	vUjd/ZMvpiuXrK4p4pfuAsnE=
Date: Fri, 21 Feb 2020 22:50:15 +0200
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20200221205015.GA13612@localhost>
References: <20200221204440.16807-1-bunk@stusta.de>
MIME-Version: 1.0
In-Reply-To: <20200221204440.16807-1-bunk@stusta.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [meta-networking][warrior][PATCH] modemmanager: Upgrade 1.8.2 -> 1.8.4
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
X-List-Received-Date: Fri, 21 Feb 2020 20:50:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This one and the next 2 patches have been resent with the correct [meta-oe].

cu
Adrian

