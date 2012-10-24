Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1TR0Ky-0005aG-Ku
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 14:45:32 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so552665ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=rCCfOaGxTU+2uP+kH9ZaPpeghXT/N18LlYZp/D3nli4=;
	b=krHyKKGOFpPbmlP1PkhoY5QVFvN/dzpdvKG9EKDY+BQnqbTnpdHywAJR6BDmCBAKkd
	uQGO6G7fwWFOH97l6CrkC4dFdW2GWaMhNAlkylFNgxKtqWgVZOoNfqVSF6zjjzqh43+K
	4hbj4hEsleXQifI8ehlHDwovPtPObhZATZy+gPoeIaq8eFKkluDAOZUE3VnkLtiWNwEN
	fTexagrp5qvVC6Hi8qp9k8Is3BfoakSSNEetRfH+wb8nknbjNeQmoN0lIiqdlNXSALqz
	FK42dUZeFufHqVmOttZnXtgN9gBr+fGN6X76LgbsyxnK+Eir6lBZjOul6d/D320C98uH
	DDMA==
Received: by 10.50.56.139 with SMTP id a11mr2262516igq.3.1351081924747;
	Wed, 24 Oct 2012 05:32:04 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id u4sm1879155igw.6.2012.10.24.05.32.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 05:32:03 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Wed, 24 Oct 2012 08:32:19 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1350659734-10362-1-git-send-email-ferlandm@sonatest.com>
Date: Wed, 24 Oct 2012 08:32:18 -0400
In-Reply-To: <1350659734-10362-1-git-send-email-ferlandm@sonatest.com> (Marc
	Ferland's message of "Fri, 19 Oct 2012 11:15:33 -0400")
Message-ID: <878vawvynh.fsf@sonatest.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] lmsensors: Initial commit (cover letter)
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
X-List-Received-Date: Wed, 24 Oct 2012 12:45:32 -0000
Content-Type: text/plain

Bump!

Marc Ferland <ferlandm@sonatest.com> writes:

> Third version of the patch for lmsensors based on comments from Koen.
>
> Marc Ferland (1):
>   lmsensors: Initial commit.
>
>  .../recipes-support/lm_sensors/files/fancontrol    |    2 +
>  .../recipes-support/lm_sensors/files/fancontrol.sh |   48 +++++++
>  .../recipes-support/lm_sensors/files/sensord.cgi   |   10 ++
>  .../recipes-support/lm_sensors/files/sensord.conf  |   16 +++
>  .../recipes-support/lm_sensors/files/sensord.sh    |   49 +++++++
>  .../recipes-support/lm_sensors/files/sensors.conf  |    2 +
>  .../recipes-support/lm_sensors/lmsensors_3.3.2.bb  |  140 ++++++++++++++++++++
>  7 files changed, 267 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol
>  create mode 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol.sh
>  create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.cgi
>  create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.conf
>  create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.sh
>  create mode 100644 meta-oe/recipes-support/lm_sensors/files/sensors.conf
>  create mode 100644 meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb


