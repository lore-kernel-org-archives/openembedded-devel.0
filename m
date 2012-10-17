Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TOULe-0004mM-FZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 16:11:50 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2012 06:58:31 -0700
Received: by mail-wg0-f43.google.com with SMTP id dq11so5577482wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 06:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=b8yDmDwTg26UgeLNeLEWpARiovb+Ydqq0pmpDsKQM64=;
	b=P1/2a03Y/HeujT2AMBpHmZ57iekOtdMJ+bqtNBIWMXD57nqahO+II8839tDG5DQaH7
	PugM9rjLLpC7StNgpESe8E9rfJPo5pqsmGaGgTCc5Z7s3vYu/+ba8E+XObAaw7snNaCB
	5OhQ3wT8sga32BU73ykeOd/xn60B+dXYZmqLA0Fm3KPKEEpas98MAjxqZwix5KQAA9em
	8/yhjGQ3k34dyYbUnk2sXO1Mx/mdgsntdTtogxQmYlOvbIOAiuWW69JZU6dK0qLBjYbx
	sCRaXAnTAicDSl3C+LbRyS6LgRkZzjvlGgdJRJDjRB+2CsvhzQphAIjptM5xzNqJpico
	pPSw==
Received: by 10.216.216.220 with SMTP id g70mr10493078wep.83.1350482306316;
	Wed, 17 Oct 2012 06:58:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ay10sm27761957wib.2.2012.10.17.06.58.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 06:58:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 14:57:17 +0100
Message-Id: <1350482238-27747-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk6pCVL68AnPpDYiq6YFKz//wguQ2+zxhk3YvbNKczgDzVWZRQOuEpjzLOGwXOxD9KfXghw
Subject: [PATCH V2] gst123: add package
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
X-List-Received-Date: Wed, 17 Oct 2012 14:11:50 -0000

V2 of this patch, adding it to meta-multimedia as recommended by Paul E.

Ross



