Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TRklW-0007oP-4I
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 16:20:02 +0200
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2012 07:06:02 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so8514330obb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 07:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:cc:content-type
	:x-gm-message-state;
	bh=+oavJE1/dXPDzkYAmHuycYNGIMCDUFdFPtKOSKH0Jj0=;
	b=nedmSVMrDv18GjDY11h7NxtcpZFPFcS7ltBiWXEoBcMvtil9On9O0dGvgcyGytTOqX
	rmipwlZWT8E/ph77FA65lk6d9+hWdju1XiE8KjT0UxXsTOmKh0yNNOWUFp7FasjlNcax
	FLOzfFzdgzABu1hEJcws1jmkxh4SqO0nl1Q4TVC0yPbvy1ug6DbsIUSdu2lE32ZRavYp
	obyQ91ok5V8yc+JabRF6Epv1EQT8Au+FYoH30h6HAIqj1ZVKIT40EOaaGvyM9xieQ1wU
	CM1ChtkclhNufn4VxUiUCcmS/OzMgBAB8/dYUBIQSxr1EnBB4IW+8IJP/gvss76uq+St
	ewVA==
Received: by 10.60.170.9 with SMTP id ai9mr18939290oec.36.1351259083364;
	Fri, 26 Oct 2012 06:44:43 -0700 (PDT)
Received: by 10.60.170.9 with SMTP id ai9mr18939283oec.36.1351259083274; Fri,
	26 Oct 2012 06:44:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Fri, 26 Oct 2012 06:44:22 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Oct 2012 14:44:22 +0100
Message-ID: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkq046CZX5zjEc2z1IAiUsfCgrywtUeXlSthOcluHRX36vhPwf/Q8/xgVFxT9xQRW09sNVO8Ikztrmh6AnImJk5/yF/oJYoiArcXvywZq1dHZq54gDV2d1rrVFNzeapUftWfEtIIkfBeKOrX4D6H9y1+XreSBsXISaEtZaOWZj+rpsoiDPkDn9VZYM159A5X2+RHT30
Cc: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Danny stable release branch
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
X-List-Received-Date: Fri, 26 Oct 2012 14:20:02 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Now that 1.3 is released[1] I can announce that I'm the Danny stable
release series maintainer.  This involves pulling any relevant
security fixes, build fixes and critical bug fixes from master, and
periodically rolling a 1.3.x release.

Obviously there's a lot of activity in master so whilst I intend to
consider every commit, if anyone submits patches to master that should
also be in danny, please say so either in a direct mail or with a tag
in the subject line.

Expect to see a ross/danny-next series in the poky-contrib repository
fairly soon where I'll be staging the commits.

Ross

[1] http://www.yoctoproject.org/blogs/davest/2012/yocto-project-v1.3-released
if anyone missed the news


