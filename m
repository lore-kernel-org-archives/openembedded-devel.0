Received: from [74.125.46.155] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1K4qt5-0000Pb-B6
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jun 2008 07:22:48 +0200
Received: by yw-out-1718.google.com with SMTP id 5so814895ywr.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jun 2008 22:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to
	:user-agent:mime-version:to:cc:subject:content-type
	:content-transfer-encoding;
	bh=AwYb7yfbF8fDmxMPP9ltGke7+gZi4FXJ67SmqQRpcdk=;
	b=dqZrf8V+RJB3MtAWegmYDyJfKatITyRQpFE01MUUIBpHg+0uiFOg/cnKrvzwQZ3UdD
	2WBw/UyQEx0I4H0iQHI0y5IO+CDtBEFzLWWPqjOsgUimghc6aKR+XXzVA8zG0UY5Zz+w
	WHtACWVEL8YVfnnTeTBzVu6wrlEn5N6IZ0FxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	b=KuIhndJnuMUPIjKbxWHcEvf6CUwxnR5Qcb+uv3Fm2JmgF4Qlq29w2HdmJVxz91EeEM
	gcnWTRxd6xmXJ38DP1LfS3uQjaSvzcKVWGoXjenb97HH9KFr96jHxiG44g/v5YswOz0y
	wDSPD03xD4GsqDVuKHSYU2krHty/H6oqODvg0=
Received: by 10.150.49.1 with SMTP id w1mr1625203ybw.26.1212815872389;
	Fri, 06 Jun 2008 22:17:52 -0700 (PDT)
Received: from ?192.168.1.204? ( [68.188.71.196])
	by mx.google.com with ESMTPS id s59sm8430697pyh.13.2008.06.06.22.17.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 06 Jun 2008 22:17:51 -0700 (PDT)
Message-ID: <484A19EE.3020609@gmail.com>
Date: Sat, 07 Jun 2008 00:17:34 -0500
From: Gordon <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.14 (X11/20080509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Cc: Discussion and review of changes to the stable branch and its policy
	<openembedded-stablebranch@openembedded.org>
Subject: stable branch commits not logged by oe-commits
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 07 Jun 2008 05:22:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This appears to happen after the stable branch name switching from 
.angstrom-2007.1 to .stable. Maybe the mtn server hook script needs an 
update?

Regards
Gordon


