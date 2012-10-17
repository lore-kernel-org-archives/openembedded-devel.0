Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TOUil-000273-4t
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 16:35:43 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Oct 2012 07:21:59 -0700
Received: by mail-we0-f175.google.com with SMTP id t44so4492473wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 07:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=4y6MMjGFbE5qWRDr7j1kb0qzL7ykNvCle48RXoVBYXY=;
	b=PvGjPY5Glue7cZYQQq2PWACjsoqoQYjvmKK05Ty7QPNc5LlxShicxEqOCRNKyPBX+A
	3OlM49Uuc4i9RSYlAVjI1WXTsflqbrN2dcervd7oFHRgsAwrANOviFwkhNJBHpfIXM3c
	fknQneWArY6pNVWg3Hh9GeOs71G/a2BJwq4m1DadebB3CYhz6OiX0ZmVWUqa4ZLYxSww
	I/Oqq4qmpLym5mpspzL7U46GX7lfaJestuv/WXLy1X1yMjqgT29bugl/Jc+z9MBwFF2w
	eRpv84oLE3SLysr7fcGY1GKfTs7klhYazY3EE9ujIZfQwZgALCyDZkwZZOCKffy0+ih3
	8KzA==
Received: by 10.180.90.201 with SMTP id by9mr4529112wib.5.1350483742086;
	Wed, 17 Oct 2012 07:22:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bn7sm27887640wib.8.2012.10.17.07.22.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 07:22:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 15:21:10 +0100
Message-Id: <1350483671-28179-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnzUqZEzCUdSjnwuPI6q+YaI+mm4alAEwX3eUWtlFDiOoWaZK9nEZreB6EFqGnYCC4AUpGY
Subject: [V3] [meta-multimedia] gst123: add package
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
X-List-Received-Date: Wed, 17 Oct 2012 14:35:43 -0000

Hopefully this is the right format this time...



