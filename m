Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 041A660272
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 18:11:52 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w4so5526387plz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 10:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/fKp90tCLe0jMZSpbzNpbURsVPk8Ezr8XWLMgylUWDg=;
	b=KvMxteKfQydiJ7nATu05jpLo5ycFc2uZBvqCpyVm5lHwY9jTJjwNM+SA48pSlPG3kP
	vWO1ngiB2XypnDKACutkYE8T9CIyolonJULWQ1dg2IgHK7VZ19dSFD+kuv8hr3Tf9mRr
	PCCyoSlj806yiQxRvicdzTEAgBQnqvBeTFl5lgB1e544wAdKMs1N0xZHRrsWnSZKkexR
	0Bk8/uQWBAa+NCItlXhpd9VuvAAmz9bqq+dLrP4k8/J1I9yZg1IRJ85BxspuN45xJjTM
	WJ1QJiAgo5La/7J3qqxBMXqnC61lqi5MfK9GOO1xMLpXiuQbmGficM/8lznKH7P8s1Zq
	+Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/fKp90tCLe0jMZSpbzNpbURsVPk8Ezr8XWLMgylUWDg=;
	b=YRFeqOcyWC4nnP5YIrziTDfLK40AaV5FYW+tau5GUmr7FZeSwE0LJOWXPLCSb1wiNe
	eeCdnYb3r1MyNKkF6CkJn8g4hbe3NJMxwZtF5SOz5/SrGjtSZAhqL6NNEDz1aEypZfTj
	eAm9IkUtX0xABHFrd+2x5LLFi+2F0TWd7OlN8VpclNkl9u94WE6dmxtX1Cq/bCgQ5zvp
	wyyQQdvGuKUbu2oQWsW13vo8qhAulEvhN6Cl2naEjNTas4WE4OlYWFEwnzAjN2UArv7/
	f4+EFtyhh76Bl5+Nig8aKZoxZ5054p6AgzVMSTtUJo0GqgjFdoUFlW8gZDJqrYHD0GmS
	tpMA==
X-Gm-Message-State: AJcUukcwlXUvwHdW7IWP5y8XrRTTzxNZeNxjNsmqppmWtWW3gDP+k+KE
	mNdjrElV7lULoo57iKPMZCZhjWoEQMQ=
X-Google-Smtp-Source: ALg8bN6OGfAjkFfbzUduDdSEql5bi3zEZpQJv3ujkU1JXjN9xNiJDeci+cOalZnF/PpINDHL0QkjZQ==
X-Received: by 2002:a17:902:76cb:: with SMTP id
	j11mr11567617plt.179.1547143913014; 
	Thu, 10 Jan 2019 10:11:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::9055])
	by smtp.gmail.com with ESMTPSA id
	h64sm120064903pfc.142.2019.01.10.10.11.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 10:11:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2019 10:11:44 -0800
Message-Id: <20190110181145.18912-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] licenses: Add Arphic-Public-License text
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
X-List-Received-Date: Thu, 10 Jan 2019 18:11:53 -0000
Content-Transfer-Encoding: 8bit

ttf-arphic-uming recipe in meta-oe needs this
source: http://ftp.gnu.org/gnu/non-gnu/chinese-fonts-truetype/LICENSE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/licenses/Arphic-Public-License | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 meta-oe/licenses/Arphic-Public-License

diff --git a/meta-oe/licenses/Arphic-Public-License b/meta-oe/licenses/Arphic-Public-License
new file mode 100644
index 0000000000..7e38aa59b5
--- /dev/null
+++ b/meta-oe/licenses/Arphic-Public-License
@@ -0,0 +1,58 @@
+ARPHIC PUBLIC LICENSE
+
+Copyright (C) 1999 Arphic Technology Co., Ltd.
+11Fl. No.168, Yung Chi Rd., Taipei, 110 Taiwan
+All rights reserved except as specified below.
+
+Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is forbidden.
+
+Preamble
+
+   The licenses for most software are designed to take away your freedom to share and change it. By contrast, the ARPHIC PUBLIC LICENSE specifically permits and encourages you to use this software, provided that you give the recipients all the rights that we gave you and make sure they can get the modifications of this software.
+
+Legal Terms
+
+0. Definitions:
+   Throughout this License, "Font" means the TrueType fonts "AR PL Mingti2L Big5", "AR PL KaitiM Big5" (BIG-5 character set) and "AR PL SungtiL GB", "AR PL KaitiM GB" (GB character set) which are originally distributed by Arphic, and the derivatives of those fonts created through any modification including modifying glyph, reordering glyph, converting format, changing font name, or adding/deleting some characters in/from glyph table.
+
+   "PL" means "Public License".
+
+   "Copyright Holder" means whoever is named in the copyright or copyrights for the Font.
+
+   "You" means the licensee, or person copying, redistributing or modifying the Font.
+
+   "Freely Available" means that you have the freedom to copy or modify the Font as well as redistribute copies of the Font under the same conditions you received, not price. If you wish, you can charge for this service.
+
+1. Copying & Distribution
+   You may copy and distribute verbatim copies of this Font in any medium, without restriction, provided that you retain this license file (ARPHICPL.TXT) unaltered in all copies.
+
+2. Modification
+   You may otherwise modify your copy of this Font in any way, including modifying glyph, reordering glyph, converting format, changing font name, or adding/deleting some characters in/from glyph table, and copy and distribute such modifications under the terms of Section 1 above, provided that the following conditions are met:
+
+   a) You must insert a prominent notice in each modified file stating how and when you changed that file.
+
+   b) You must make such modifications Freely Available as a whole to all third parties under the terms of this License, such as by offering access to copy the modifications from a designated place, or distributing the modifications on a medium customarily used for software interchange.
+
+   c) If the modified fonts normally reads commands interactively when run, you must cause it, when started running for such interactive use in the most ordinary way, to print or display an announcement including an appropriate copyright notice and a notice that there is no warranty (or else, saying that you provide a warranty) and that users may redistribute the Font under these conditions, and telling the user how to view a copy of this License.
+
+   These requirements apply to the modified work as a whole. If identifiable sections of that work are not derived from the Font, and can be reasonably considered independent and separate works in themselves, then this License and its terms, do not apply to those sections when you distribute them as separate works. Therefore, mere aggregation of another work not based on the Font with the Font on a volume of a storage or distribution medium does not bring the other work under the scope of this License.
+
+3. Condition Subsequent
+   You may not copy, modify, sublicense, or distribute the Font except as expressly provided under this License. Any attempt otherwise to copy, modify, sublicense or distribute the Font will automatically retroactively void your rights under this License. However, parties who have received copies or rights from you under this License will keep their licenses valid so long as such parties remain in full compliance.
+
+4. Acceptance
+   You are not required to accept this License, since you have not signed it. However, nothing else grants you permission to copy, modify, sublicense or distribute the Font. These actions are prohibited by law if you do not accept this License. Therefore, by copying, modifying, sublicensing or distributing the Font, you indicate your acceptance of this License and all its terms and conditions.
+
+5. Automatic Receipt
+   Each time you redistribute the Font, the recipient automatically receives a license from the original licensor to copy, distribute or modify the Font subject to these terms and conditions. You may not impose any further restrictions on the recipients' exercise of the rights granted herein. You are not responsible for enforcing compliance by third parties to this License. 
+
+6. Contradiction
+   If, as a consequence of a court judgment or allegation of patent infringement or for any other reason (not limited to patent issues), conditions are imposed on you (whether by court order, agreement or otherwise) that contradict the conditions of this License, they do not excuse you from the conditions of this License. If you cannot distribute so as to satisfy simultaneously your obligations under this License and any other pertinent obligations, then as a consequence you may not distribute the Font at all. For example, if a patent license would not permit royalty-free redistribution of the Font by all those who receive copies directly or indirectly through you, then the only way you could satisfy both it and this License would be to refrain entirely from distribution of the Font.
+
+   If any portion of this section is held invalid or unenforceable under any particular circumstance, the balance of the section is intended to apply and the section as a whole is intended to apply in other circumstances. 
+
+7. NO WARRANTY
+   BECAUSE THE FONT IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE FONT, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS OR OTHER PARTIES PROVIDE THE FONT "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE FONT IS WITH YOU. SHOULD THE FONT PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+8. DAMAGES WAIVER
+   UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING, IN NO EVENT WILL ANY COPYRIGHTT HOLDERS, OR OTHER PARTIES WHO MAY COPY, MODIFY OR REDISTRIBUTE THE FONT AS PERMITTED ABOVE, BE LIABLE TO YOU FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, INCIDENTAL, SPECIAL OR EXEMPLARY DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE FONT (INCLUDING BUT NOT LIMITED TO PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA OR PROFITS; OR BUSINESS INTERRUPTION), EVEN IF SUCH HOLDERS OR OTHER PARTIES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
-- 
2.20.1


